import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safesuit_bank/core/presentation/bloc/user/user_bloc.dart';
import 'package:safesuit_bank/core/presentation/screens/login.dart';
import 'package:safesuit_bank/core/presentation/screens/home.dart';
import 'package:safesuit_bank/data/repositories/user_repository_impl.dart';
import 'package:safesuit_bank/services/api_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserBloc(userRepository: UserRepositoryImpl()),
        ),
      ],
      child: MaterialApp(
        title: 'Safe Suit Bank',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        home: const InitialScreen(), // Determina la pantalla inicial
      ),
    );
  }
}

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  Future<bool> _checkAuthStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');
    print("Token in InitialScreen: $token"); // Debug line
    return token != null && token.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _checkAuthStatus(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasData && snapshot.data == true) {
          return const HomeView();
        } else {
          return const LoginPage();
        }
      },
    );
  }
}
