import 'dart:async';

import 'package:teachers_app/utilis.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  bool isLoading = false;

  User? get user => _auth.currentUser;

  Stream<User?> get authStream => _auth.authStateChanges();

  Future<void> createUserWithEmailAndPassword(String email, String password,
      {required BuildContext context}) async {
    isLoading = true;
    notifyListeners();

    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (error) {
      Utils.showSnackBar(context, Utils.errorSnackBar(message: error.code));
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // sign in with Google
  Future<void> signInWithGoogle({required BuildContext context}) async {
    isLoading = true;
    notifyListeners();
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) return;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential authResult =
          await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (error) {
      Utils.showSnackBar(context, Utils.errorSnackBar(message: error.message!));
    } catch (error) {
      Utils.showSnackBar(
          context, Utils.errorSnackBar(message: error.toString()));
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> signInWithEmailAndPassword(String email, String password,
      {required BuildContext context}) async {
    isLoading = true;
    notifyListeners();
    try {
      final UserCredential authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      print(authResult.toString());
    } on FirebaseAuthException catch (error) {
      Utils.showSnackBar(context, Utils.errorSnackBar(message: error.message!));
      return;
    } catch (error) {
      Utils.showSnackBar(
          context, Utils.errorSnackBar(message: error.toString()));
      return;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // sign out
  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }
}
