import 'package:bloc/bloc.dart';
import 'package:safesuit_bank/services/api_services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'perfil_event.dart';
import 'perfil_state.dart';

class PerfilBloc extends Bloc<PerfilEvent, PerfilState> {
  final ApiService apiService;

  PerfilBloc(this.apiService) : super(const PerfilState()) {
    on<LoadUserProfile>(_onLoadUserProfile);
    on<UpdateUserProfile>(_onUpdateUserProfile);
  }

  Future<void> _onLoadUserProfile(LoadUserProfile event, Emitter<PerfilState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('auth_token');
      if (token != null) {
        final userProfile = await apiService.getUserProfile(token);
        final data = userProfile['data'];
        emit(state.copyWith(
          userName: data['name'] ?? 'Usuario',
          email: data['email'] ?? '',
          rfc: data['rfc'] ?? '',
          phone: data['phone'] ?? '',
          password: 'xxxxxxxxxxx',
          bank: 'Safesuit Bank',
          isLoading: false,
        ));
      } else {
        throw Exception('Token no encontrado');
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> _onUpdateUserProfile(UpdateUserProfile event, Emitter<PerfilState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('auth_token');
      if (token != null) {
        await apiService.updateUserProfile(token, event.updateData);
        emit(state.copyWith(isLoading: false, isUpdated: true));
      } else {
        throw Exception('Token no encontrado');
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false, isUpdated: false));
    }
  }
}
