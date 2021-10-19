import 'package:bookmark_codebase/ui/login/logged_in_widget.dart';
import 'package:bookmark_codebase/ui/login/sign_up_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: LinearProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return const LoggedInWidget();
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('STH IS WRONG!'),
            );
          }
          return const SignUpWidget();
        },
      ),
    );
  }
}
