import 'package:bookmark_codebase/components/bottom_nav_bar/bottom_nav_bar_provider_indicator.dart';
import 'package:bookmark_codebase/components/bottom_nav_bar/main%20_page.dart';
import 'package:bookmark_codebase/ui/login/login_page.dart';
import 'package:bookmark_codebase/ui/profile/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class StartingWidget extends StatelessWidget {
  const StartingWidget({Key? key}) : super(key: key);

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
            return const CustomBottomNavigationBarProviderIndicator();
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('STH IS WRONG!'),
            );
          }
          return const LoginPage();
        },
      ),
    );
  }
}
