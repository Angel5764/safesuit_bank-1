import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safesuit_bank/core/domain/repositories/user_repository.dart';
import 'package:safesuit_bank/core/domain/usecases/load_user_data.dart' as usecase;
import 'package:safesuit_bank/main.dart';
import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc({required this.userRepository}) : super(UserInitial()) {
    on<LoginButtonPressed>(_onLoginButtonPressed);
  }

  Future<void> _onLoginButtonPressed(LoginButtonPressed event, Emitter<UserState> emit) async {
    emit(UserLoading());

    try {
      final user = await userRepository.loadFormData(
        phoneNumber: event.phoneNumber,
        password: event.password,
      );
      emit(UserAuthenticated(user: user));
      Navigator.of(event.context).pushReplacement(
        MaterialPageRoute(builder: (context) => const MyApp()),
      );
    } catch (error) {
      emit(UserAuthenticationFailure(error: error.toString()));
    }
  }
}