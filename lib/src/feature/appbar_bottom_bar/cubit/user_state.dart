

import 'package:direct_drive/src/feature/auth/model/user_model.dart';

abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final UserModel user;

  UserLoaded(this.user);
}

class UserError extends UserState {
  final String message;

  UserError(this.message);
}
