import 'package:safesuit_bank/core/domain/models/sidebarModel.dart';

abstract class SidebarRepository{
  Future<SidebarModel> loadFormData();
}