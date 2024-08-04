import 'package:safesuit_bank/core/domain/entities/user_home.dart';

class UserHomeModel extends UserHome {
  UserHomeModel({required String name, required String email})
      : super(name: name, email: email);

  factory UserHomeModel.fromJson(Map<String, dynamic> json) {
    return UserHomeModel(
      name: json['name'] ?? 'Usuario',
      email: json['email'] ?? 'No email found',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
    };
  }
}
