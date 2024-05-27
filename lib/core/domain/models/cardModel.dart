// import 'package:safesuit_bank/core/domain/entities/card.dart';
import 'package:json_annotation/json_annotation.dart';
part 'cardModel.g.dart';
@JsonSerializable()

class CardModel{
  final String number;
  final int ccv;
  final String expireDate;
  final String owner;
  final String bankName;

  CardModel ({required this.number,
    required this.ccv,
    required this.expireDate,
    required this.owner,
    required this.bankName,
  });

factory CardModel.fromJson(Map<String, dynamic> json) => _$CardModelFromJson(json);
Map <String, dynamic> toJson() => _$CardModelToJson(this);
}
