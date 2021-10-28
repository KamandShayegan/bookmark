import 'package:bookmark_codebase/components/bottom_nav_bar/page_two.dart';
import 'package:bookmark_codebase/ui/login/starting_widget.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  '/myApp': (_) => const MyApp(),
  '/': (_) => const StartingWidget(),
  // '/': (_) => Page2(),

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
