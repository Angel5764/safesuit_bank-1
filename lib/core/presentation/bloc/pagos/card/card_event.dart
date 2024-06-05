import 'package:equatable/equatable.dart';

abstract class CardEvent extends Equatable {
  const CardEvent();

  @override
  List<Object> get props => [];
}

class LoadCardDataEvent extends CardEvent {
  get amounCard => null;
}

class CantCardChanged extends CardEvent {
  final double amounCard;

  const CantCardChanged(this.amounCard);

  @override
  List<Object> get props => [amounCard];
}
