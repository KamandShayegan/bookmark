import 'package:bookmark_codebase/components/buttons/exit_button.dart';
import 'package:bookmark_codebase/ui/profile/users_google_account_details.dart';
import 'package:flutter/material.dart';

class ProfilesTopCard extends StatelessWidget {
  const ProfilesTopCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 40, bottom: 16),
      child: const Align(
        alignment: Alignment.center,
        child: UsersGoogleAccountDetails(),
      ),
    );
  }
}
