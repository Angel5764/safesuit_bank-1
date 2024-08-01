import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safesuit_bank/core/presentation/bloc/user/user_bloc.dart';
import 'package:safesuit_bank/core/presentation/screens/login.dart'; // Importa el nuevo archivo
import 'package:safesuit_bank/data/repositories/user_repository_impl.dart';

void
    main() {
  WidgetsFlutterBinding
      .ensureInitialized();
  runApp(
      const MyApp());
}

class MyApp
    extends StatelessWidget {
  const MyApp(
      {super.key});

  @override
  Widget
      build(BuildContext context) {
    return MaterialApp(
      title: 'Safe Suit Bank',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: BlocProvider(
        create: (context) => UserBloc(userRepository: UserRepositoryImpl()),
        child: const LoginPage(), // Usa el nuevo widget de inicio de sesión
      ),
    );
  }
}
