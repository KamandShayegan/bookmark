import 'package:bookmark_codebase/utils/constants/color_constants.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Widget title;
  final VoidCallback onTap;
  final Color defaultColor;
  final Color tappedColor;
  final bool isOn;
  final double width;
  final bool isPrimary;

  const Button(
      {Key? key,
      required this.title,
      this.isOn = true,
      required this.onTap,
      this.defaultColor = MyColors.bone,
      this.tappedColor = MyColors.bone, required this.width, this.isPrimary=true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var tapped = tappedColor.withOpacity(0.5);

    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return isOn? tapped : Colors.transparent;
      }
      return isOn ? defaultColor : defaultColor.withOpacity(0.2);
    }

    double getElevation(Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed)) {
        return 3;
      } else {
        return 1;
      }
    }

    return OutlinedButton(
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all<Size>(Size(width, 48)),
        side: MaterialStateProperty.all<BorderSide>(
          BorderSide(
            color: isOn ? (isPrimary?tappedColor:defaultColor):defaultColor,
            width: 1

          ),
        ),
        backgroundColor: MaterialStateProperty.resolveWith(getColor),
        overlayColor: MaterialStateProperty.resolveWith(getColor),
      ),
      onPressed: isOn ? onTap : null,
      child: title,
    );
  }
}
