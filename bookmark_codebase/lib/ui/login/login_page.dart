import 'package:bookmark_codebase/business_logic/providers/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 40,
          width: 90,
          child: ElevatedButton(
            onPressed: () {
              final provider = context.read<GoogleSignInProvider>();
              provider.googleLogin();
            },
            child: Center(
              child: Text('ورود'),
            ),
          ),
        ),
      ),
    );
  }
}
