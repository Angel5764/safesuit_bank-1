import 'package:equatable/equatable.dart';

abstract class PerfilEvent extends Equatable {
  const PerfilEvent();

  @override
  List<Object> get props => [];
}

class LoadUserProfile extends PerfilEvent {}

class UpdateUserProfile extends PerfilEvent {
  final Map<String, String> updateData;

  const UpdateUserProfile(this.updateData);

  @override
  List<Object> get props => [updateData];
}
