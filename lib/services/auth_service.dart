import 'package:teachers_app/utilis.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<UserCredential?> createUserWithEmailAndPassword(
      String email, String password,
      {required BuildContext context}) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (error) {
      Utils.showSnackBar(context, Utils.errorSnackBar(message: error.code));
      return null;
    }
  }

  // sign in with Google
  Future<User?> signInWithGoogle({required BuildContext context}) async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential authResult =
          await _auth.signInWithCredential(credential);

      return authResult.user;
    } on FirebaseAuthException catch (error) {
      Utils.showSnackBar(context, Utils.errorSnackBar(message: error.message!));
      return null;
    } catch (error) {
      Utils.showSnackBar(
          context, Utils.errorSnackBar(message: error.toString()));
      return null;
    }
  }

  Future<User?> signInWithEmailAndPassword(String email, String password,
      {required BuildContext context}) async {
    try {
      final UserCredential authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return authResult.user;
    } on FirebaseAuthException catch (error) {
      Utils.showSnackBar(context, Utils.errorSnackBar(message: error.message!));
      return null;
    } catch (error) {
      Utils.showSnackBar(
          context, Utils.errorSnackBar(message: error.toString()));
      return null;
    }
  }

  // sign out
  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }
}
