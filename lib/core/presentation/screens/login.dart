import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_auth/local_auth.dart';
import 'package:safesuit_bank/core/domain/usecases/load_user_data.dart';
import 'package:safesuit_bank/core/presentation/bloc/user/user_bloc.dart';
import 'package:safesuit_bank/core/presentation/bloc/user/user_event.dart';
import 'package:safesuit_bank/core/presentation/bloc/user/user_state.dart';
import 'package:safesuit_bank/core/presentation/screens/home.dart';
import 'package:safesuit_bank/core/presentation/screens/UserRegistration.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isChecked = false;
  final LocalAuthentication _localAuthentication = LocalAuthentication();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _auth() async {
    bool authenticated = false;
    try {
      authenticated = await _localAuthentication.authenticate(
        localizedReason: "Autentíquese para acceder",
        options: const AuthenticationOptions(stickyAuth: true, useErrorDialogs: true),
      );
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    if (authenticated) {
      // Navegación directa al HomeView si la autenticación biométrica es exitosa
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeView()),
      );
    } else {
      if (kDebugMode) {
        print("Fallo de autenticación");
      }
    }
  }

  void _onLoginButtonPressed() {
    final phone = _phoneController.text.trim();
    final password = _passwordController.text.trim();

    if (_validatePhoneNumber(phone) && _validatePassword(password)) {
      // Emite el evento de inicio de sesión al BLoC
      BlocProvider.of<UserBloc>(context).add(
        LoginButtonPressed(
          phoneNumber: phone,
          password: password,
          context: context,
        ),
      );
    } else {
      // Muestra un mensaje de error si las credenciales no son válidas
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Número de teléfono o contraseña inválidos')),
      );
    }
  }

  bool _validatePhoneNumber(String phoneNumber) {
    // Valida que el número de teléfono tenga 10 dígitos
    final RegExp phoneExp = RegExp(r'^\d{10}$');
    if (!phoneExp.hasMatch(phoneNumber)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Número de teléfono debe tener 10 dígitos')),
      );
      return false;
    }
    return true;
  }

  bool _validatePassword(String password) {
    // Longitud mínima de 8 caracteres, al menos una letra y un número
    final RegExp passwordExp = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');
    if (!passwordExp.hasMatch(password)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('La contraseña debe tener al menos 8 caracteres, una letra y un número')),
      );
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<UserBloc, UserState>(
        listener: (context, state) {
          if (state is UserAuthenticated) {
            // Navega a HomeView cuando el usuario está autenticado
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeView()),
            );
          } else if (state is UserAuthenticationFailure) {
            // Muestra un mensaje de error si el inicio de sesión falla
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(11.0),
            width: 480,
            height: 566,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Colors.black,
                width: 2.0,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              children: [
                const Image(
                  image: AssetImage("assets/images/Logo.jpg"),
                  height: 200,
                  fit: BoxFit.contain,
                ),
                TextField(
                  decoration: const InputDecoration(hintText: "Número de teléfono"),
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                ),
                TextField(
                  decoration: const InputDecoration(hintText: "Contraseña"),
                  controller: _passwordController,
                  obscureText: true,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: _isChecked,
                      onChanged: (newValue) {
                        setState(() => _isChecked = newValue!);
                      },
                      checkColor: Colors.black,
                      fillColor: MaterialStateProperty.all(Colors.white),
                    ),
                    const Text("Mantener sesión activa"),
                  ],
                ),
                ElevatedButton(
                  onPressed: _onLoginButtonPressed,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
                  ),
                  child: const Text(
                    "Inicia sesión",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const Text("\nO"),
                IconButton(
                  onPressed: _auth, // Llama al método de autenticación biométrica
                  icon: const Icon(
                    Icons.fingerprint,
                    size: 50,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UserRegistrationView(),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
                  ),
                  child: const Text(
                    "Registrarse",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
