import 'package:bookmark_codebase/business_logic/providers/google_sign_in_provider.dart';
import 'package:bookmark_codebase/utils/constants/string_constants.dart';
import 'package:bookmark_codebase/utils/constants/svg_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.read<GoogleSignInProvider>();

    return TextButton(
      onPressed: () => provider.signInwithGoogle(),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Text(StringConstants.googleSignIn,
                style: Theme.of(context).textTheme.headline1),
            const SizedBox(
              width: 8,
            ),
            const VerticalDivider(
              width: 24,
              color: Colors.white,
              thickness: 1,
            ),
            const SizedBox(
              width: 8,
            ),
            SvgPicture.asset(SvgPaths.googleLogo, height: 40),
          ],
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
      ),
    );
  }
}
