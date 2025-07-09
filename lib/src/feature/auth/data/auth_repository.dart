import '../model/user_model.dart';
import 'auth_service.dart';

class AuthRepository {
  AuthRepository() {
    _service = AuthService();
  }

  late AuthService _service;
  Future<UserModel?> signUpWithEmail({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) {
    return _service.signUpWithEmail(
      email: email,
      password: password,
      firstName: firstName,
      lastName: lastName,
    );
  }

  Future<UserModel?> signInWithEmail({
    required String email,
    required String password,
  }) {
    return _service.signInWithEmail(email: email, password: password);
  }

  Future<UserModel?> signInWithGoogle() {
    return _service.signInWithGoogle();
  }

  Future<void> signOut() {
    return _service.signOut();
  }

  Future<void> restpassword(String email) {
    return _service.restpassword(email);
  }

  Future<UserModel?> getUserById(String uid) {
    return _service.getUserData(uid);
  }

  UserModel? get currentUser {
    final user = _service.currentUser;
    if (user == null) return null;
    return UserModel(uid: user.uid, email: user.email ?? '');
  }
}
