import 'package:json_annotation/json_annotation.dart';

part 'friendModel.g.dart';

@JsonSerializable()
class FriendModel {
  final String name;
  final String cardNumber;

  FriendModel({required this.name, required this.cardNumber});

  factory FriendModel.fromJson(Map<String, dynamic> json) => _$FriendModelFromJson(json);
  Map<String, dynamic> toJson() => _$FriendModelToJson(this);
}
