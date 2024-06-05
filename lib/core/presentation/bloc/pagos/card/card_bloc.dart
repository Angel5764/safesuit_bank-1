import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safesuit_bank/core/domain/usecases/load_card_data.dart' as usecase;
import 'card_event.dart';
import 'card_state.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  final usecase.LoadCardData loadCardData;

  CardBloc(this.loadCardData) : super(const CardState()) {
    on<LoadCardDataEvent>((event, emit) async {
      final CardData = await loadCardData();
      emit(CardState.fromModel(CardData));
    });

    on<LoadCardDataEvent>((event, emit) {
      emit(state.copyWith(
        amounCard: event.amounCard, amounUser: null,
      ));
    });
  }
}
