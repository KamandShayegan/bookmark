import 'package:bookmark_codebase/components/bottom_nav_bar/page_one.dart';
import 'package:bookmark_codebase/components/bottom_nav_bar/page_two.dart';
import 'package:bookmark_codebase/utils/methods/actions_on_lists/actions_on_lists.dart';
import 'package:flutter/material.dart';

// enum NavBarPage {
//   ASSET_MANAGEMENT,
//   DASHBOARD,
//   NEW_TRX,
// }

class BottomNavigationBarProvider extends ChangeNotifier {
  static List<Widget> pages = [
    Page2(),
    const Page1(),
  ];

  Widget _currentPage = pages[1];

  get getCurrentPage => _currentPage;

  setCurrentPage(int index) {
    _currentPage = pages[index];
    ActionsOnLists().optionSelector(clickedState, index);
    notifyListeners();
  }

  static List<bool> clickedState = [false, true];

  get getClickedState => clickedState;
}
