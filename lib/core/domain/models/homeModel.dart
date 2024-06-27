// import 'package:safesuit_bank/core/domain/entities/card.dart';
import 'package:json_annotation/json_annotation.dart';

part 'homeModel.g.dart';

@JsonSerializable()
class HomeModel {
  final String
      name;
  final String
      lastName;
  final double
      money;

  HomeModel({
    required this.name,
    required this.lastName,
    required this.money,
  });
  factory HomeModel.fromJson(Map<String, dynamic> json) =>
      _$HomeModelFromJson(json);
  Map<String, dynamic> toJson() =>
      _$HomeModelToJson(this);
}
