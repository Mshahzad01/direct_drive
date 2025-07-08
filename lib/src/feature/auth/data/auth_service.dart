import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../model/user_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GoogleSignIn signIn = GoogleSignIn();


  Future<UserModel?> signUpWithEmail({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = userCredential.user;
      if (user != null) {
        final userModel = UserModel(
          uid: user.uid,
          email: user.email!,
          firstName: firstName,
          lastName: lastName,
        );
        await _firestore.collection('users').doc(user.uid).set(userModel.toMap());
        return userModel;
      }
      return null;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message ?? 'Signup failed');
    } catch (e) {
      throw Exception('Signup failed');
    }
  }

  Future<UserModel?> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = userCredential.user;
      if (user != null) {
        final doc = await _firestore.collection('users').doc(user.uid).get();
        if (doc.exists) {
          return UserModel.fromMap(doc.data()!);
        }
        return UserModel(uid: user.uid, email: user.email!);
      }
      return null;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message ?? 'Login failed');
    } catch (e) {
      throw Exception('Login failed');
    }
  }

  Future<UserModel?> signInWithGoogle() async {
    try {
      final googleUser = await signIn.signIn();
      if (googleUser == null) return null;
      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final userCredential = await _auth.signInWithCredential(credential);
      final user = userCredential.user;
      if (user != null) {
        final userModel = UserModel(
          uid: user.uid,
          email: user.email!,
          firstName: user.displayName?.split(' ').first,
          lastName: user.displayName?.split(' ').length == 2 ? user.displayName?.split(' ').last : null,
          photoUrl: user.photoURL,
        );
        await _firestore.collection('users').doc(user.uid).set(userModel.toMap(), SetOptions(merge: true));
        return userModel;
      }
      return null;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message ?? 'Google sign-in failed');
    } catch (e) {
      throw Exception('Google sign-in failed');
    }
  }


  Future<void> restpassword(String email)  async{

      try{

     await   _auth.sendPasswordResetEmail(email: email);
     print("rest email sent");

      }catch(e){

          rethrow;

      }
  
  }

  Future<void> signOut() async {
    await _auth.signOut();
    await signIn.signOut();
  }


  Future<UserModel?> getUserData(String uid) async {
  try {
    final doc = await _firestore.collection('users').doc(uid).get();
    if (doc.exists) {
      return UserModel.fromMap(doc.data()!);
    } else {
      return null;
    }
  } catch (e) {
    throw Exception('Failed to fetch user data');
  }
}


  User? get currentUser => _auth.currentUser;
} 