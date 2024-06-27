import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:safesuit_bank/core/domain/models/sidebarModel.dart';
import 'package:safesuit_bank/core/domain/repositories/sidebar_repository.dart';

class SidebarRepositoryImpl implements SidebarRepository{
  @override
  Future<SidebarModel> loadFormData() async {
    final response = await rootBundle.loadString('json_data/sidebar.json');
    final data = json.decode(response);
    if (kDebugMode) {
    print(data);
    }
    return SidebarModel.fromJson(data);
  }
}