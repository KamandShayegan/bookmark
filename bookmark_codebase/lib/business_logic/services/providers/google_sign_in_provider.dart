import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  Future signInwithGoogle() async {
    try {
      final _googleUser = await _googleSignIn.signIn();

      if (_googleUser == null) return;
      _user = _googleUser;
      final googleAuth = await _googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      await FirebaseAuth.instance.signInWithCredential(credential);
      notifyListeners();
    } on FirebaseAuthException catch (_) {
      rethrow;
    }
  }

  Future<void> signOutFromGoogle() async {
    await _googleSignIn.disconnect();
    await _auth.signOut();
    await _googleSignIn.signOut();
    notifyListeners();
  }
}
// final googleSignIn = GoogleSignIn(scopes: <String>['email', 'profile']);
// GoogleSignInAccount? _user;
// GoogleSignInAccount get user => _user!;

// Future googleLogin() async {
//   final googleUser = await googleSignIn.signIn();
//   if (googleUser == null) return;
//   _user = googleUser;
//   final googleAuth = await googleUser.authentication;
//   final credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
//   await FirebaseAuth.instance.signInWithCredential(credential);

//   notifyListeners();
// }
// }
