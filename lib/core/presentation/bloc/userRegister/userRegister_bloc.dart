import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safesuit_bank/core/domain/usecases/load_userRegister_data.dart'  as usecase;
import 'userRegister_event.dart';
import 'userRegister_state.dart';

class UserRegisterBloc extends Bloc<UserRegisterEvent, UserRegisterState> {
  final usecase.SubmitUserRegisterData submitUserRegisterData;

  UserRegisterBloc(this.submitUserRegisterData) : super(RegisterInitial()) {
    on<SubmitUserRegister>((event, emit) async {
      emit(RegisterLoading());
      try {
        await submitUserRegisterData(event.register);
        emit(RegisterSuccess());
      } catch (error) {
        emit(const RegisterError('Failed to submit Register'));
      }
    });

    on<LoadUserRegisterEvent>((event, emit) async {
      // Aquí deberías cargar los datos necesarios para la vista de registro
      // Esto puede incluir cargar datos de un repositorio o realizar otras operaciones necesarias.
      // Como ejemplo, aquí se emite directamente el estado inicial del registro.
      emit(RegisterInitial());
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
