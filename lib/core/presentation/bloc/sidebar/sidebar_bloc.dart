import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safesuit_bank/core/domain/usecases/load_sidebar_data.dart' as usecase;
import 'sidebar_event.dart';
import 'sidebar_state.dart';

class SidebarBloc extends Bloc<SidebarEvent, SidebarState> {
  final usecase.LoadSidebarData loadSidebarData;

  SidebarBloc(this.loadSidebarData) : super(const SidebarState()) {
    on<LoadSidebarDataEvent>((event, emit) async {
      final sidebarData = await loadSidebarData();
      emit(SidebarState.fromModel(sidebarData));
    });

    on<SidebarPerfilChanged>((event, emit) {
      emit(state.copyWith(
        username: event.username,
        email: event.email        
      ));
    });
  }
}
