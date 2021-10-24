import 'package:bookmark_codebase/business_logic/services/providers/bottom_navigation_bar_provider.dart';
import 'package:bookmark_codebase/components/bottom_nav_bar/each_nav_bar_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  _CustomNavigationBarState createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {

  @override
  Widget build(BuildContext context) {
    var wModel = context.watch<BottomNavigationBarProvider>();
    // var rModel = context.read<BottomNavigationBarProvider>();
    List<bool> clickedState = wModel.getClickedState;
    var size = MediaQuery.of(context).size;
    double width = size.width;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [

        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: width,
            height: 90,
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NavBarButton(
                  isOn: clickedState[0],
                  buttonNo: 0,
                ),
                NavBarButton(isOn: clickedState[1], buttonNo: 1),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
