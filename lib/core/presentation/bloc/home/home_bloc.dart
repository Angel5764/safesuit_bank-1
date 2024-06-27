import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safesuit_bank/core/domain/usecases/load_home_data.dart'
    as usecase;
import 'package:safesuit_bank/core/presentation/bloc/home/home_event.dart';
import 'package:safesuit_bank/core/presentation/bloc/home/home_state.dart';

class HomeBloc extends Bloc<
    HomeEvent,
    HomeState> {
  final usecase
      .LoadHomeData
      loadHomeData;

  HomeBloc(
      this.loadHomeData)
      : super(const HomeState()) {
    on<LoadHomeDataEvent>((event,
        emit) async {
      final homeData = await loadHomeData();
      emit(HomeState.fromModel(homeData));
    });

    on<NameChanged>((event,
        emit) {
      final isValid = _validateHome(
        name: event.name,
        lastName: state.lastName,
        money: state.money,
      );
      emit(state.copyWith(name: event.name, isValid: isValid));
    });
  }

  bool
      _validateHome({
    required String
        name,
    required String
        lastName,
    required double
        money,
  }) {
    return name.isNotEmpty &&
        lastName.isNotEmpty &&
        money > 0;
  }
}
