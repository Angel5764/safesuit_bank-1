// import 'package:safesuit_bank/core/domain/entities/sidebar.dart';
import 'package:json_annotation/json_annotation.dart';
part 'sidebarModel.g.dart';

@JsonSerializable()
class SidebarModel {

  final String accountName;
  final String accountEmail;

  SidebarModel ({
  required this.accountName,
  required this.accountEmail,
  });

  factory SidebarModel.fromJson(Map<String, dynamic> json) => _$SidebarModelFromJson(json);
  Map<String, dynamic> toJson() => _$SidebarModelToJson(this);
  
}