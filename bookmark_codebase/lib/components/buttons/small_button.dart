import 'package:bookmark_codebase/utils/constants/color_constants.dart';
import 'package:flutter/material.dart';

class SmallButton extends StatelessWidget {
  final Widget title;
  final VoidCallback onTap;
  final Color defaultColor;
  final Color tappedColor;
  const SmallButton(
      {Key? key,
      required this.title,
      required this.onTap,
      this.defaultColor = MyColors.bone,
      this.tappedColor = MyColors.bone})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var tapped = tappedColor.withOpacity(0.8);

    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return tapped;
      }
      return defaultColor;
    }

    double getElevation(Set<MaterialState> states){
      if(states.contains(MaterialState.pressed)){
        return 3;
      }else{
        return 1;
      }
    }

    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith(getColor),
        overlayColor: MaterialStateProperty.resolveWith(getColor),
      ),
      onPressed: onTap,
      child: title,
    );
  }
}
