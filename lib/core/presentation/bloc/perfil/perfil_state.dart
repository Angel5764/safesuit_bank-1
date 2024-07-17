import 'package:equatable/equatable.dart';

class PerfilState extends Equatable {
  final String userName;
  final String email;
  final String rfc;
  final String phone;
  final String password;
  final String bank;
  final bool isLoading;
  final bool isUpdated;

  const PerfilState({
    this.userName = 'Cargando...',
    this.email = '',
    this.rfc = '',
    this.phone = '',
    this.password = '',
    this.bank = 'Safesuit Bank',
    this.isLoading = false,
    this.isUpdated = false,
  });

  PerfilState copyWith({
    String? userName,
    String? email,
    String? rfc,
    String? phone,
    String? password,
    String? bank,
    bool? isLoading,
    bool? isUpdated,
  }) {
    return PerfilState(
      userName: userName ?? this.userName,
      email: email ?? this.email,
      rfc: rfc ?? this.rfc,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      bank: bank ?? this.bank,
      isLoading: isLoading ?? this.isLoading,
      isUpdated: isUpdated ?? this.isUpdated,
    );
  }

  @override
  List<Object> get props => [userName, email, rfc, phone, password, bank, isLoading, isUpdated];
}
