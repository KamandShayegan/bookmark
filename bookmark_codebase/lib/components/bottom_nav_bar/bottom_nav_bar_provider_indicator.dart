import 'package:bookmark_codebase/business_logic/services/providers/bottom_navigation_bar_provider.dart';
import 'package:bookmark_codebase/components/bottom_nav_bar/main%20_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomBottomNavigationBarProviderIndicator extends StatelessWidget {
  const CustomBottomNavigationBarProviderIndicator({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BottomNavigationBarProvider(),
      builder: (context, widget) => const LoggedInPage(),

    );
  }
}
