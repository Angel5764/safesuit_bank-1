import 'package:equatable/equatable.dart';
import 'package:safesuit_bank/core/domain/models/homeModel.dart';

class HomeState
    extends Equatable {
  final String
      name;
  final String
      lastName;
  final double
      money;
  final bool
      isValid;

  const HomeState({
    this.name =
        '',
    this.lastName =
        '',
    this.money =
        0,
    this.isValid =
        false,
  });

  factory HomeState.fromModel(
      HomeModel model) {
    return HomeState(
      name: model.name,
      lastName: model.lastName,
      money: model.money,
      isValid: true,
    );
  }

  HomeState
      copyWith({
    String?
        name,
    String?
        lastName,
    double?
        money,
    bool?
        isValid,
  }) {
    return HomeState(
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      money: money ?? this.money,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object?> get props =>
      [
        name,
        lastName,
        money,
        isValid
      ];
}
