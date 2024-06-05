import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safesuit_bank/core/domain/usecases/load_user_data.dart' as usecase;
import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final usecase.LoadUserData loadUserData;

  UserBloc(this.loadUserData) : super(const UserState()) {
    on<LoadUserDataEvent>((event, emit) async {
      final UserData = await loadUserData();
      emit(UserState.fromModel(UserData));
    });

    on<LoadUserDataEvent>((event, emit) {
      emit(state.copyWith(
        amounUser: event.amounUser,
      ));
    });
  }
}
