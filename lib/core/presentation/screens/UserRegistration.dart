import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safesuit_bank/core/domain/usecases/load_userRegister_data.dart';
import 'package:safesuit_bank/core/presentation/bloc/userRegister/userRegister_bloc.dart';
import 'package:safesuit_bank/core/presentation/bloc/userRegister/userRegister_event.dart';
import 'package:safesuit_bank/core/presentation/bloc/userRegister/userRegister_state.dart';
import 'package:safesuit_bank/core/presentation/screens/home.dart';
import 'package:safesuit_bank/data/repositories/userRegister_repository_impl.dart';

class UserRegistrationView extends StatefulWidget {
  const UserRegistrationView({super.key});

  @override
  State<UserRegistrationView> createState() => _UserRegistrationViewState();
}

class _UserRegistrationViewState extends State<UserRegistrationView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserRegisterBloc(LoadUserRegisterData(UserRegisterRepositoryImpl()))
        ..add(LoadUserRegisterEvent()),
      child: BlocBuilder<UserRegisterBloc, UserRegisterState>(
        builder: (context, state) {
          if (kDebugMode) {
            print(state.toString());
          }

          TextEditingController nameController = TextEditingController(
            text: state.name,
          );
          TextEditingController lastNameController = TextEditingController(
            text: state.lastName,
          );
          TextEditingController emailController = TextEditingController(
            text: state.email,
          );
          TextEditingController rfcController = TextEditingController(
            text: state.rfc,
          );
          TextEditingController phoneController = TextEditingController(
            text: state.phone,
          );
          TextEditingController passwordController = TextEditingController(
            text: state.password,
          );

          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'User Registration',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  color: Color.fromARGB(255, 242, 244, 250),
                ),
              ),
              backgroundColor: const Color.fromARGB(255, 66, 79, 120),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            body: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      if (state.errorMessage.isNotEmpty)
                        Text(
                          state.errorMessage,
                          style: const TextStyle(color: Colors.red),
                        ),
                      const SizedBox(height: 25.0),
                      Center(
                        child: Image.asset(
                          'assets/images/logo.jpg',
                          width: 150.0,
                          height: 150.0,
                        ),
                      ),
                      const SizedBox(height: 25.0),
                      SizedBox(
                        width: 300,
                        height: 50,
                        child: TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromARGB(255, 205, 205, 205),
                            hintText: 'Enter Name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
                          ),
                          onChanged: (value) {
                            context.read<UserRegisterBloc>().add(NameChanged(name: value));
                          },
                        ),
                      ),
                      const SizedBox(height: 25.0),
                      SizedBox(
                        width: 300,
                        height: 50,
                        child: TextField(
                          controller: lastNameController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromARGB(255, 205, 205, 205),
                            hintText: 'Enter Last Name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
                          ),
                          onChanged: (value) {
                            context.read<UserRegisterBloc>().add(LastNameChanged(lastName: value));
                          },
                        ),
                      ),
                      const SizedBox(height: 25.0),
                      SizedBox(
                        width: 300,
                        height: 50,
                        child: TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromARGB(255, 205, 205, 205),
                            hintText: 'Enter Email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
                          ),
                          onChanged: (value) {
                            context.read<UserRegisterBloc>().add(EmailChanged(email: value));
                          },
                        ),
                      ),
                      const SizedBox(height: 25.0),
                      SizedBox(
                        width: 300,
                        height: 50,
                        child: TextField(
                          controller: rfcController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromARGB(255, 205, 205, 205),
                            hintText: 'Enter RFC',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
                          ),
                          onChanged: (value) {
                            context.read<UserRegisterBloc>().add(RfcChanged(rfc: value));
                          },
                        ),
                      ),
                      const SizedBox(height: 25.0),
                      SizedBox(
                        width: 300,
                        height: 50,
                        child: TextField(
                          controller: phoneController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromARGB(255, 205, 205, 205),
                            hintText: 'Enter Phone Number',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
                          ),
                          onChanged: (value) {
                            context.read<UserRegisterBloc>().add(PhoneChanged(phone: value));
                          },
                        ),
                      ),
                      const SizedBox(height: 25.0),
                      SizedBox(
                        width: 300,
                        height: 50,
                        child: TextField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromARGB(255, 205, 205, 205),
                            hintText: 'Enter Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
                          ),
                          onChanged: (value) {
                            context.read<UserRegisterBloc>().add(PasswordChanged(password: value));
                          },
                        ),
                      ),
                      const SizedBox(height: 25.0),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => const HomeView()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: const Color.fromARGB(255, 242, 244, 250),
                          backgroundColor: const Color.fromARGB(255, 66, 79, 120),
                          minimumSize: const Size(150, 50),
                        ),
                        child: const Text(
                          'Register',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      const SizedBox(height: 150.0),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
