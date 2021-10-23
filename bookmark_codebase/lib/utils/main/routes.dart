import 'package:bookmark_codebase/ui/login/login_page.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  '/myApp': (_) => const MyApp(),
  '/': (_) => const LoginPage(),

  // '/': (_) => const ExpansionWidget(
  //     readingStatus: ReadingStatus.goingToRead,
  //     expansionHeader: Scaffold(
  //       body: Center(
  //         child: Text('fd'),
  //       ),
  //     ),
  //     expansionBody: Scaffold(
  //       body: Center(
  //         child: Text('fd'),
  //       ),
  //     )),
};
