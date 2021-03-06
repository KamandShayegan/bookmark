import 'package:bookmark_codebase/business_logic/services/providers/google_sign_in_provider.dart';
import 'package:bookmark_codebase/utils/methods/angles/rotate_widge_180_degrees.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ExitButton extends StatelessWidget {
  const ExitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.red.shade50;
      }
      return Colors.white;
    }

    return TextButton.icon(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith(getColor),
        overlayColor: MaterialStateProperty.resolveWith(getColor),
      ),
      onPressed: () {
        final provider = context.read<GoogleSignInProvider>();
        provider.signOutFromGoogle();
        Navigator.pop(context);
      },
      icon: Text(
        'خروج از حساب کاربری',
        style: Theme.of(context).textTheme.caption!.apply(color: Colors.red),
      ),
      label: const Rotator180(
        child: FaIcon(
          FontAwesomeIcons.signOutAlt,
          color: Colors.red,
          size: 14,
        ),
      ),
    );
  }
}
