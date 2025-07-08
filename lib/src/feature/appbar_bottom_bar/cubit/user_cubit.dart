import 'package:direct_drive/src/feature/auth/data/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final AuthRepository repository;

  UserCubit(this.repository) : super(UserInitial());

  Future<void> loadUserData() async {
    emit(UserLoading());

    try {
      final user = await repository.getUserById(repository.currentUser?.uid ?? '');
      if (user != null) {
        emit(UserLoaded(user));
      } else {
        emit(UserError("User not found"));
      }
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }
}
