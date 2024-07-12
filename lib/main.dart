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
import 'package:safesuit_bank/data/repositories/user_repository_impl.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Safe Suit Bank',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: BlocProvider(
        create: (context) => UserBloc(userRepository: UserRepositoryImpl()),
        child: const MyHomePage(title: ''),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isChecked = false;
  final LocalAuthentication _localAuthentication = LocalAuthentication();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _auth() async {
    bool authenticated = false;
    try {
      authenticated = await _localAuthentication.authenticate(
        localizedReason: "Autenticate para acceder",
        options: const AuthenticationOptions(
            stickyAuth: true, useErrorDialogs: true),
      );
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    if (authenticated) {
      Navigator.pushReplacement<void, void>(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute<void>(
          builder: ((context) => const HomeView()),
        ),
      );
    } else {
      if (kDebugMode) {
        print("fallo auth");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<UserBloc, UserState>(
        listener: (context, state) {
          if (state is UserAuthenticated) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const MyApp()),
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
                  decoration:
                      const InputDecoration(hintText: "Numero de telefono"),
                  controller: _phoneController,
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
                    const Text("Mantener sesion activa"),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    if (LoadUserData.validatePhoneNumber(_phoneController.text) &&
                        LoadUserData.validatePassword(_passwordController.text)) {
                      BlocProvider.of<UserBloc>(context).add(
                        LoginButtonPressed(
                          phoneNumber: _phoneController.text,
                          password: _passwordController.text,
                          context: context,
                        ),
                      );
                      Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeView()));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Número de teléfono o contraseña inválidos')),
                      );
                    }
                  },
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
                  onPressed: () => {
                    _auth(),
                  },
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
                        builder: (context) => UserRegistrationView(),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
                  ),
                  child: const Text(
                    "registrarse",
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