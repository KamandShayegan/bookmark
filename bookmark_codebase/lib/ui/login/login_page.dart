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
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  const SizedBox(height: 48,),
                  SvgPicture.asset(SvgPaths.bookshelf, height: Sizes.loginLogo,),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    StringConstants.landing,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ],
              ),
              const SizedBox(height: 8,),
              const GoogleSignInButton(),
              // SizedBox(height: Sizes.fromBottom,)
            ],
        ),
      ),
          )),
    );
  }
}
