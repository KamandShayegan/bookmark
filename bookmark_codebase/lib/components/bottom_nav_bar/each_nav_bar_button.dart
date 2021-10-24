import 'package:bookmark_codebase/business_logic/services/providers/bottom_navigation_bar_provider.dart';
import 'package:bookmark_codebase/utils/constants/svg_constants.dart';
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
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: isOn ? Colors.black : Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          width: size.width * 0.18,
          height: size.height * 0.10,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 20,
                child: Center(
                  child: SvgPicture.asset(
                    _setButtonSVG(buttonNo, isOn),
                    color: isOn ? Colors.white : Colors.black,
                    width: 24,
                  ),
                ),
              ),
              _setBelowButtonText(buttonNo, isOn)
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            context
                .read<BottomNavigationBarProvider>()
                .setCurrentPage(buttonNo);
          },
          child: Container(
            height: 70,
            width: 60,
            color: Colors.transparent,
          ),
        ),
      ],
    );
  }

  String _setButtonSVG(int buttonNo, bool isOn) {
    switch (buttonNo) {
      case 1:
        if (isOn) {
          return NavBarIcon.selectedProfile;
        } else {
          return NavBarIcon.unSelectedProfile;
        }
      case 0:
        if (isOn) {
          return NavBarIcon.selectedBook;
        } else {
          return NavBarIcon.unSelectedBook;
        }
      default:
        return '';
    }
  }

  Text _setBelowButtonText(int buttonNo, bool isOn) {
    Text? text;
    if (isOn && buttonNo == 1) {
      text = const Text(
        'پروفایل',
        style: TextStyle(color: Colors.white),
      );
    } else if (!isOn && buttonNo == 1) {
      text = const Text(
        'پروفایل',
        style: TextStyle(color: Colors.black),
      );
    } else if (isOn && buttonNo == 0) {
      text = const Text(
        'کتابها',
        style: TextStyle(color: Colors.white),
      );
    } else if (!isOn && buttonNo == 0) {
      text = const Text(
        'کتابها',
        style: TextStyle(color: Colors.black),
      );
    }
    return text ?? Text('nothing');
  }
}
