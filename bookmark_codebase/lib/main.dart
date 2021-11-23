import 'package:bookmark_codebase/business_logic/services/providers/google_sign_in_provider.dart';
import 'package:bookmark_codebase/business_logic/services/providers/search_book/search_book_provider.dart';
import 'package:bookmark_codebase/utils/main/routes.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'business_logic/services/providers/bookshelf/handle_bookshelves.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => GoogleSignInProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => HandlingBookshelvesProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SearchBookProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'IranYekanWeb',
          // primarySwatch: ,
          // primaryColor: MyColors.blue,
          scaffoldBackgroundColor: Colors.white,
          textTheme: const TextTheme(
              //AppBar font style.
              headline2: TextStyle(
                fontSize: 11,
              ),
              button: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              //H7-18 Medium
              headline1: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              subtitle1: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              subtitle2: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              bodyText1: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w100,
              ),
              bodyText2: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              caption: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
              overline: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 8,
              ),
              headline3: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontFamily: 'ExtraBold',
                  fontSize: 18),
              headline4: TextStyle(
                  fontFamily: 'ExtraBold',
                  fontSize: 24,
                  fontWeight: FontWeight.w800),
              headline5: TextStyle(
                fontFamily: 'FaNum',
                fontSize: 14,
              ),
              headline6: TextStyle(fontFamily: 'FaNum', fontSize: 12)
              // mosradmard
              // mostafa33
              // 239728
              ),
        ),
        routes: routes,
        initialRoute: '/',
      ),
    );
  }
}
