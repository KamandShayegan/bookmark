import 'package:bookmark_codebase/business_logic/services/providers/bottom_navigation_bar_provider.dart';
import 'package:bookmark_codebase/utils/constants/color_constants.dart';
import 'package:bookmark_codebase/utils/constants/svg_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class NavBarButton extends StatelessWidget {
  final int buttonNo;
  final bool isOn;

  const NavBarButton({Key? key, required this.isOn, required this.buttonNo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            // color: isOn ? MyColors.bone : Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          width: size.width * 0.5,
          height: size.height * 0.10,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 20,
                child: Center(
                  child: SvgPicture.asset(
                    _setButtonSVG(buttonNo),
                    color: _setSvgColor(isOn),
                    width: 24,
                  ),
                ),
              ),
              Text(_setBelowButtonText(buttonNo),
                  style: _setBelowButtonTextStyle(isOn)),
            ],
          ),
        ),
        GestureDetector(
          onTap: () => _turnButtonOn(context),
          child: Container(
            width: size.width * 0.5,
            height: size.height * 0.10,
            color: Colors.transparent,
          ),
        ),
      ],
    );
  }

  String _setButtonSVG(int buttonNo) {
    switch (buttonNo) {
      case 1:
        return NavBarIcon.unSelectedProfile;
      case 0:
        return NavBarIcon.selectedBook;

      default:
        return '';
    }
  }

  String _setBelowButtonText(int buttonNo) {
    if (buttonNo == 1) {
      return 'پروفایل';
    } else {
      return 'کتابها';
    }
  }

  _turnButtonOn(BuildContext context) {
    context.read<BottomNavigationBarProvider>().setCurrentPage(buttonNo);
  }

  TextStyle _setBelowButtonTextStyle(bool isOn) {
    return TextStyle(
      color: isOn
          ? MyColors.selectedBottomNavColor
          : MyColors.unSelectedBottomNavColor,
      // fontWeight: isOn?FontWeight.w600:FontWeight.w500
    );
  }

  Color _setSvgColor(bool isOn) {
    return isOn
        ? MyColors.selectedBottomNavColor
        : MyColors.unSelectedBottomNavColor;
  }
}
