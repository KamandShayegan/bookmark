import 'package:bookmark_codebase/business_logic/providers/google_sign_in_provider.dart';
import 'package:bookmark_codebase/utils/main/routes.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // primarySwatch: Colors.blue,
          // primaryColor: Colors.black,
          textTheme: const TextTheme(
            headline1: TextStyle(
              color: Colors.white,
              fontFamily: 'iransans',
              fontSize: 30,
            ),
          ),
        ),
        routes: routes,
        initialRoute: '/',
      ),
    );
  }
}
