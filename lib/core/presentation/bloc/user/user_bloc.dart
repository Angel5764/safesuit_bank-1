import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safesuit_bank/core/domain/usecases/load_user_data.dart'
    as usecase;
import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<
    UserEvent,
    UserState> {
  final usecase
      .LoadUserData
      loadUserData;

  UserBloc(
      this.loadUserData)
      : super(const UserState()) {
    on<LoadUserDataEvent>((event,
        emit) async {
      try {
        final userData = await loadUserData();
        emit(UserState.fromModel(userData));
      } catch (error) {
        print("Error cargando datos del usuario: $error");
      }
    });

    on<CantUserChanged>((event,
        emit) {
      emit(state.copyWith(
        money: event.amounUser,
      ));
    });

    on<UserNameChanged>((event,
        emit) {
      emit(state.copyWith(
        name: event.name,
        lastName: event.lastName,
      ));
    });
  }
}
