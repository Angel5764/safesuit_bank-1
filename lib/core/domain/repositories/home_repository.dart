import 'package:safesuit_bank/core/domain/models/homeModel.dart';

abstract class HomeRepository {
  Future<HomeModel>
      loadHomeData();
}
