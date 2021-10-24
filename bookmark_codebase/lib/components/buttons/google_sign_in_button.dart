import 'package:bookmark_codebase/business_logic/services/providers/google_sign_in_provider.dart';
import 'package:bookmark_codebase/utils/constants/size_constants.dart';
import 'package:bookmark_codebase/utils/constants/string_constants.dart';
import 'package:bookmark_codebase/utils/constants/svg_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        final provider = context.read<GoogleSignInProvider>();
        provider.signInwithGoogle();
      },
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              StringConstants.googleSignIn,
              style: Theme.of(context)
                  .textTheme
                  .button!
                  .apply(color: Colors.white),
            ),
            const SizedBox(
              width: 8,
            ),
            Container(
              height: 60,
              width: 2,
              color: Colors.white,
            ),
            SvgPicture.asset(SvgPaths.googleLogo, height: 24),
          ],
        ),
      ),
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.all(0),
        ),
        fixedSize: MaterialStateProperty.all<Size>(
          const Size(Sizes.bigButtonWidth, Sizes.buttonHeight),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
      ),
    );
  }
}
