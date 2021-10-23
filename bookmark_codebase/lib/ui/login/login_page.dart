import 'package:bookmark_codebase/components/buttons/google_sign_in_button.dart';
import 'package:bookmark_codebase/components/directions/custom_directionality.dart';
import 'package:bookmark_codebase/utils/constants/size_constants.dart';
import 'package:bookmark_codebase/utils/constants/string_constants.dart';
import 'package:bookmark_codebase/utils/constants/svg_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RTLDirection(
      child: Scaffold(
          body: Center(
        child: Column(
          children: [
            SvgPicture.asset(SvgPaths.loginLogo, height: Sizes.loginLogo),
            const SizedBox(
              height: 16,
            ),
            const Text(
              StringConstants.landing,
              textAlign: TextAlign.center,
            ),
            const GoogleSignInButton(),
          ],
        ),
      )),
    );
  }
}
