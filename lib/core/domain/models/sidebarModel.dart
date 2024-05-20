import 'package:safesuit_bank/core/domain/entities/sidebar.dart';

class SidebarModel {

  final String username;
  final String email;

  SidebarModel ({required this.username,
  required this.email,
  });

  factory SidebarModel.fromEntity(SidebarEntity sidebarentity){
    return SidebarModel(username: sidebarentity.username, email: sidebarentity.email);
  }
}