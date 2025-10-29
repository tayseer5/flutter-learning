import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart';

class AuthService {
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  
  AuthService(this._auth);
  
  Future<User?> signUpWithEmailAndPassword({required String email, required String password}) async {
    try {
      final cred = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return cred.user;
    } on FirebaseAuthException catch (e) {
      debugPrint('Sign up error: ${e.message}');
      rethrow;
    } catch (e) {
      debugPrint('Unexpected sign up error: $e');
      rethrow;
    }
  }

  Future<User?> loginWithEmail(String email, String password) async {
    try {
      final cred = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return cred.user;
    } on FirebaseAuthException catch (e) {
      debugPrint('Login error: ${e.message}');
      rethrow;
    } catch (e) {
      debugPrint('Unexpected login error: $e');
      rethrow;
    }
  }

  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null;
      
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final cred = await _auth.signInWithCredential(credential);
      return cred.user;
    } on FirebaseAuthException catch (e) {
      debugPrint('Google sign in error: ${e.message}');
      rethrow;
    } catch (e) {
      debugPrint('Unexpected Google sign in error: $e');
      rethrow;
    }
  }
  
  Future<void> logout() async {
    try {
      await Future.wait([
        _googleSignIn.signOut(),
        _auth.signOut(),
      ]);
    } catch (e) {
      debugPrint('Logout error: $e');
      rethrow;
    }
  }
}