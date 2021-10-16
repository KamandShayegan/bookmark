import 'package:codebase/components/expansion_panel/expansion_panel.dart';
import 'package:codebase/utils/enums/reading_status_enums.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  '/myApp': (_) => MyApp(),
  '/': (_) => const ExpansionWidget(
      readingStatus: ReadingStatus.goingToRead,
      expansionHeader: Scaffold(
        body: Center(
          child: Text('fd'),
        ),
      ),
      expansionBody: Scaffold(
        body: Center(
          child: Text('fd'),
        ),
      )),
};
