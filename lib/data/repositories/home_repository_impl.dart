import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:safesuit_bank/core/domain/models/homeModel.dart';
import 'package:safesuit_bank/core/domain/repositories/home_repository.dart';

class HomeRepositoryImpl
    implements
        HomeRepository {
  @override
  Future<HomeModel>
      loadHomeData() async {
    final response =
        await rootBundle.loadString('/json_data/home.json');
    final data =
        json.decode(response);
    print(data);
    return HomeModel.fromJson(data);
  }
}
