
import 'package:bookmark_codebase/ui/profile/profile.dart';
import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  int currentTab = 0;
  final List<Widget> screens = [];
  @override
  Widget build(BuildContext context) {
    return const Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.purple,
        body: Profile(),
      ),
    );
  }
}
