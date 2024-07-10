import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safesuit_bank/core/domain/models/userRegisterModel.dart';
import 'package:safesuit_bank/core/domain/usecases/load_userRegister_data.dart';
import 'package:safesuit_bank/core/presentation/bloc/userRegister/userRegister_bloc.dart';
import 'package:safesuit_bank/core/presentation/bloc/userRegister/userRegister_event.dart';
import 'package:safesuit_bank/core/presentation/bloc/userRegister/userRegister_state.dart';
import 'package:safesuit_bank/data/repositories/userRegister_repository_impl.dart';

class UserRegistrationView extends StatefulWidget {
  const UserRegistrationView({super.key});

  @override
  State<UserRegistrationView> createState() => _UserRegistrationViewState();
}

class _UserRegistrationViewState extends State<UserRegistrationView> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController rfcController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserRegisterBloc(SubmitUserRegisterData(UserRegisterRepositoryImpl()))
        ..add(LoadUserRegisterEvent()),
      child: BlocBuilder<UserRegisterBloc, UserRegisterState>(
        builder: (context, state) {
          if (kDebugMode) {
            print(state.toString());
          }

          if (state is RegisterInitial) {
            return buildForm(context);
          } else if (state is RegisterLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is RegisterSuccess) {
            return buildSuccessMessage();
          } else if (state is RegisterError) {
            return buildErrorMessage(state.message);
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget buildForm(BuildContext context) {
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
                SizedBox(height: 25.0),
                buildTextField(
                  controller: nameController,
                  hintText: 'Enter Name',
                  onChanged: (value) => context.read<UserRegisterBloc>().add(NameChanged(name: value)),
                ),
                SizedBox(height: 25.0),
                buildTextField(
                  controller: lastNameController,
                  hintText: 'Enter Last Name',
                  onChanged: (value) => context.read<UserRegisterBloc>().add(LastNameChanged(lastName: value)),
                ),
                SizedBox(height: 25.0),
                buildTextField(
                  controller: emailController,
                  hintText: 'Enter Email',
                  onChanged: (value) => context.read<UserRegisterBloc>().add(EmailChanged(email: value)),
                ),
                SizedBox(height: 25.0),
                buildTextField(
                  controller: rfcController,
                  hintText: 'Enter RFC',
                  onChanged: (value) => context.read<UserRegisterBloc>().add(RfcChanged(rfc: value)),
                ),
                SizedBox(height: 25.0),
                buildTextField(
                  controller: phoneController,
                  hintText: 'Enter Phone Number',
                  onChanged: (value) => context.read<UserRegisterBloc>().add(PhoneChanged(phone: value)),
                ),
                SizedBox(height: 25.0),
                buildTextField(
                  controller: passwordController,
                  hintText: 'Enter Password',
                  obscureText: true,
                  onChanged: (value) => context.read<UserRegisterBloc>().add(PasswordChanged(password: value)),
                ),
                SizedBox(height: 25.0),
                ElevatedButton(
                  onPressed: () {
                    final register = UserRegisterModel(
                      name: nameController.text,
                      lastName: lastNameController.text,
                      email: emailController.text,
                      rfc: rfcController.text,
                      phone: phoneController.text,
                      password: passwordController.text,
                    );
                    context.read<UserRegisterBloc>().add(SubmitUserRegister(register));
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
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String hintText,
    bool obscureText = false,
    required ValueChanged<String> onChanged,
  }) {
    return SizedBox(
      width: 300,
      height: 50,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color.fromARGB(255, 205, 205, 205),
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
        ),
        obscureText: obscureText,
        onChanged: onChanged,
      ),
    );
  }

  Widget buildSuccessMessage() {
    return Scaffold(
      body: Center(
        child: Text('User registration successful', style: TextStyle(fontSize: 24, color: Colors.green)),
      ),
    );
  }

  Widget buildErrorMessage(String message) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(message, style: TextStyle(fontSize: 24, color: Colors.red)),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
