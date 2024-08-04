import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safesuit_bank/core/domain/usecases/get_user_home_profile.dart';
import 'package:safesuit_bank/core/presentation/bloc/homes/user_home_event.dart';
import 'package:safesuit_bank/core/presentation/bloc/homes/user_home_state.dart';

class UserHomeBloc extends Bloc<UserHomeEvent, UserHomeState> {
  final GetUserHomeProfile getUserHomeProfile;

  UserHomeBloc({required this.getUserHomeProfile}) : super(UserHomeState.initial()) {
    on<FetchUserHomeProfile>(_onFetchUserHomeProfile);
    on<TokenNotFoundEvent>(_onTokenNotFound);
  }

  Future<void> _onFetchUserHomeProfile(FetchUserHomeProfile event, Emitter<UserHomeState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      final user = await getUserHomeProfile();
      emit(state.copyWith(
        isLoading: false,
        userName: user.name,
        userEmail: user.email,
      ));
    } catch (error) {
      emit(state.copyWith(
        isLoading: false,
        error: error.toString(),
      ));
    }
  }

  void _onTokenNotFound(TokenNotFoundEvent event, Emitter<UserHomeState> emit) {
    emit(state.copyWith(isLoading: false, error: "Token no encontrado"));
  }
}
