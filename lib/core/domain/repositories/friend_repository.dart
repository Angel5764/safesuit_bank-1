import 'package:safesuit_bank/core/domain/models/friendModel.dart';

abstract class FriendRepository{
  Future<FriendModel> loadFormData();
}