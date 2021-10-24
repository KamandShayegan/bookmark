// ignore: file_names
// ignore_for_file: file_names

import 'package:bookmark_codebase/business_logic/services/providers/bottom_navigation_bar_provider.dart';
import 'package:bookmark_codebase/components/bottom_nav_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoggedInPage extends StatelessWidget {
  const LoggedInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BottomNavigationBarProvider wModel =
        context.watch<BottomNavigationBarProvider>();
    Widget currentPage = wModel.getCurrentPage;

    return Stack(
      children: [
        currentPage,
        Align(
          alignment: Alignment.bottomCenter,
          child: CustomNavigationBar(),
        )
      ],
    );
  }
}
