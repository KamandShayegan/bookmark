import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<String?> signInwithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (_) {
      rethrow;
    }
    notifyListeners();
  }

  Future<void> signOutFromGoogle() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
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
