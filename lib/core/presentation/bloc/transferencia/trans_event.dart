import 'package:equatable/equatable.dart';

abstract class TransferEvent extends Equatable {
  const TransferEvent();

  @override
  List<Object> get props => [];
}

class LoadTransferDataEvent extends TransferEvent {}

class TransferenciaSuccess extends TransferEvent {}

// Estado de error
class TransferenciaError extends TransferEvent {
  final String message;

  const TransferenciaError(this.message);

  @override
  List<Object> get props => [message];
}
class UserIdTransferChanged extends TransferEvent {
  final int idUser;

  const UserIdTransferChanged(this.idUser);

  @override
  List<Object> get props => [idUser];
}

class NicknameTransferChanged extends TransferEvent {
  final String nickname;

  const NicknameTransferChanged(this.nickname);

  @override
  List<Object> get props => [nickname];
}

class EmailTransferChanged extends TransferEvent {
  final String email;

  const EmailTransferChanged(this.email);

  @override
  List<Object> get props => [email];
}

class PhoneTransferChanged extends TransferEvent {
  final String phone;

  const PhoneTransferChanged(this.phone);

  @override
  List<Object> get props => [phone];
}

class BankNameTransferChanged extends TransferEvent {
  final String bankName;

  const BankNameTransferChanged(this.bankName);

  @override
  List<Object> get props => [bankName];
}

class AccountTransferChanged extends TransferEvent {
  final String account;

  const AccountTransferChanged(this.account);

  @override
  List<Object> get props => [account];
}

class AddTransferEvent extends TransferEvent {
  final String nickname;
  final String email;
  final String phone;
  final String bankname;
  final String account;

  const AddTransferEvent({
    required this.nickname,
    required this.email,
    required this.phone,
    required this.bankname,
    required this.account,
  });

  @override
  List<Object> get props => [nickname, email, phone, bankname, account];
}
