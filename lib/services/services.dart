import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_survey_app/services/authAcc.dart';

class AuthServices {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<UserModel?> SignIn(String email, String password) async {
    try {
      UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user as User;
      return UserModel.fromFirebase(user);
    } catch (e) {
      return null;
    }
  }

  Future<UserModel?> SignUp(String email, String password) async {
    try {
      UserCredential result = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user as User;
      return UserModel.fromFirebase(user);
    } catch (e) {
      return null;
    }
  }

  Future LogOut() async {
    await _firebaseAuth.signOut();
  }

  Stream<UserModel?> get currentUser {
    // return _firebaseAuth.authStateChanges().map((User? user) => Г);
    return _firebaseAuth.authStateChanges().map(
        (User? user) => user != null ? UserModel.fromFirebase(user) : null);
  }
}