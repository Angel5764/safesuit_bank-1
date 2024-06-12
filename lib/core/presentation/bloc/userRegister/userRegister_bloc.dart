import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safesuit_bank/core/domain/usecases/load_userRegister_data.dart' as usecase;
import 'userRegister_event.dart';
import 'userRegister_state.dart';

class UserRegisterBloc extends Bloc<UserRegisterEvent, UserRegisterState> {
  final usecase.LoadUserRegisterData loadUserData;

  UserRegisterBloc(this.loadUserData) : super(const UserRegisterState()) {
    on<LoadUserDataEvent>((event, emit) async {
      final userData = await loadUserData();
      emit(UserRegisterState.fromModel(userData));
    });

    on<NameChanged>((event, emit) {
      emit(state.copyWith(name: event.name));
    });

    on<LastNameChanged>((event, emit) {
      emit(state.copyWith(lastName: event.lastName));
    });

    on<EmailChanged>((event, emit) {
      emit(state.copyWith(email: event.email));
    });

    on<RfcChanged>((event, emit) {
      emit(state.copyWith(rfc: event.rfc));
    });

    on<PhoneChanged>((event, emit) {
      emit(state.copyWith(phone: event.phone));
    });

    on<PasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password));
    });

    on<SubmitUserRegister>((event, emit) {
    });
  }
}
