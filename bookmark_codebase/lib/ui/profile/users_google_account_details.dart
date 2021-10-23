import 'package:bookmark_codebase/components/pop_ups/show_current_users_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class UsersGoogleAccountDetails extends StatelessWidget {
  const UsersGoogleAccountDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _user = FirebaseAuth.instance.currentUser;
    return InkWell(
      onTap: (){
        showDialog(
          context: context,
          builder: (BuildContext context) => ShowCurrentUsersData(context: context,),
        );
      },
      child: CircleAvatar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
        radius: 48,
        backgroundImage: NetworkImage(_user!.photoURL??'https://profiles.utdallas.edu/img/default.png'),
      ),
    );
  }
}
