import 'package:equatable/equatable.dart';

abstract class HomeEvent
    extends Equatable {
  const HomeEvent();
  @override
  List<Object?> get props =>
      [];
}

class LoadHomeDataEvent
    extends HomeEvent {}

class NameChanged
    extends HomeEvent {
  final String
      name;

  const NameChanged(
      this.name);

  @override
  List<Object?> get props =>
      [
        name
      ];
}

class LastNameChanged
    extends HomeEvent {
  final String
      lastName;

  const LastNameChanged(
      this.lastName);

  @override
  List<Object?> get props =>
      [
        lastName
      ];
}

class MoneyChanged
    extends HomeEvent {
  final double
      money;

  const MoneyChanged(
      this.money);

  @override
  List<Object?> get props =>
      [
        money
      ];
}

class HomeSubmitted
    extends HomeEvent {}
