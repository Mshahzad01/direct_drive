import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/auth_repository.dart';
import 'auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';
import '../model/registration_data.dart';

class AuthCubit extends Cubit<AuthState> {
  RegistrationData _registrationData = RegistrationData(
    email: '',
    firstName: '',
    lastName: '',
    password: '',
  );
  AuthCubit() : super(AuthInitial()) {
    _repo = AuthRepository();
  }

  late AuthRepository _repo;

  void updateEmail(String email) {
    _registrationData = _registrationData.copyWith(email: email);
  }

  void updateName(String firstName, String lastName) {
    _registrationData = _registrationData.copyWith(
      firstName: firstName,
      lastName: lastName,
    );
  }

  void updatePassword(String password) {
    _registrationData = _registrationData.copyWith(password: password);
  }

  Future<void> signUpWithEmail() async {
    emit(AuthLoading());

    try {
      final user = await _repo.signUpWithEmail(
        email: _registrationData.email,
        password: _registrationData.password,
        firstName: _registrationData.firstName,
        lastName: _registrationData.lastName,
      );
      if (user != null) {
        emit(AuthSuccess(user));
      } else {
        emit(AuthFailure('Signup failed. Please try again.'));
      }
    } on FirebaseAuthException catch (e) {
      emit(AuthFailure(_firebaseErrorMessage(e)));
    } on SocketException {
      emit(AuthFailure('No internet connection. Please check your network.'));
    } catch (e) {
      emit(AuthFailure('Signup failed: ${e.toString()}'));
    }
  }

  Future<void> signInWithEmail({
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());
    try {
      final user = await _repo.signInWithEmail(
        email: email,
        password: password,
      );
      if (user != null) {
        emit(AuthSuccess(user));
      } else {
        emit(AuthFailure('Login failed. Please try again.'));
      }
    } on FirebaseAuthException catch (e) {
      emit(AuthFailure(_firebaseErrorMessage(e)));
    } on SocketException {
      emit(AuthFailure('No internet connection. Please check your network.'));
    } catch (e) {
      emit(AuthFailure('Login failed: ${e.toString()}'));
    }
  }

  Future<void> signInWithGoogle() async {
    emit(AuthLoading());
    try {
      final user = await _repo.signInWithGoogle();
      if (user != null) {
        emit(AuthSuccess(user));
      } else {
        emit(AuthFailure('Google sign-in failed. Please try again.'));
      }
    } on FirebaseAuthException catch (e) {
      emit(AuthFailure(_firebaseErrorMessage(e)));
    } on SocketException {
      emit(AuthFailure('No internet connection. Please check your network.'));
    } catch (e) {
      emit(AuthFailure('Google sign-in failed: ${e.toString()}'));
    }
  }

  Future<void> signOut() async {
    await _repo.signOut();
    emit(AuthInitial());
  }

  Future<void> restpassword(String email) async {
    emit(AuthLoading());

    try {
      await _repo.restpassword(email);

      emit(AuthInitial());
    } catch (e) {
      emit(AuthFailure("Rest link Falid: ${e.toString()}"));
    }

    await _repo.restpassword(email);
  }

  // load fetch users data

  String _firebaseErrorMessage(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return 'The email address is badly formatted.';
      case 'user-disabled':
        return 'This user has been disabled.';
      case 'user-not-found':
        return 'No user found for this email.';
      case 'wrong-password':
        return 'Incorrect password.';
      case 'email-already-in-use':
        return 'This email is already in use.';
      case 'weak-password':
        return 'The password is too weak.';
      case 'network-request-failed':
        return 'Network error. Please check your internet connection.';
      default:
        return e.message ?? 'An unknown error occurred.';
    }
  }
}
