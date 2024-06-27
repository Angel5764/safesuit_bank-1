import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safesuit_bank/core/domain/usecases/load_userRegister_data.dart'  as usecase;
import 'userRegister_event.dart';
import 'userRegister_state.dart';

class UserRegisterBloc extends Bloc<UserRegisterEvent, UserRegisterState> {
  final usecase.LoadUserRegisterData loadUserRegisterData;

  UserRegisterBloc(this.loadUserRegisterData) : super(const UserRegisterState()) {
    on<LoadUserRegisterEvent>((event, emit) async {
      try {
        final userRegisterData = await loadUserRegisterData();
        emit(UserRegisterState.fromModel(userRegisterData));
      } catch (error) {
        emit(state.copyWith(errorMessage: error.toString()));
      }
    });

    on<NameChanged>((event, emit) {
      emit(state.copyWith(
        name: event.name, errorMessage: '',
      ));
    });

    on<LastNameChanged>((event, emit) {
      emit(state.copyWith(
        lastName: event.lastName, errorMessage: '',
      ));
    });

    on<EmailChanged>((event, emit) {
      emit(state.copyWith(
        email: event.email, errorMessage: '',
      ));
    });

    on<RfcChanged>((event, emit) {
      emit(state.copyWith(
        rfc: event.rfc, errorMessage: '',
      ));
    });

    on<PhoneChanged>((event, emit) {
      emit(state.copyWith(
        phone: event.phone, errorMessage: '',
      ));
    });

    on<PasswordChanged>((event, emit) {
      emit(state.copyWith(
        password: event.password, errorMessage: '',
      ));
    });
  }
}
