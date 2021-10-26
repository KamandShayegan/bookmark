import 'package:bookmark_codebase/components/pop_ups/show_current_users_data.dart';
import 'package:bookmark_codebase/utils/constants/svg_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:translator/translator.dart';

class UsersGoogleAccountDetails extends StatelessWidget {
  const UsersGoogleAccountDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final _user = FirebaseAuth.instance.currentUser;
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(left: 0, top: size.height * 0.06),
          child: Align(
            alignment: Alignment.center,
            child: SvgPicture.asset(
              SvgPaths.midShelf,
              width: size.width * 0.7,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
              right: size.width * 0.14, top: size.height * 0.02),
          child: InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => ShowCurrentUsersData(
                  context: context,
                ),
              );
            },
            child: CircleAvatar(
              backgroundColor: Colors.white,
              foregroundColor: Colors.white,
              radius: 48,
              backgroundImage: NetworkImage(_user!.photoURL ??
                  'https://profiles.utdallas.edu/img/default.png'),
            ),
          ),
        ),
      ],
    );
  }
}
