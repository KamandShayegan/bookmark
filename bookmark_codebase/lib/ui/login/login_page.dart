import 'package:flutter/material.dart';

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
            onPressed: () {},
            child: Center(
              child: Text('ورود'),
            ),
          ),
        ),
      ),
    );
  }
}
