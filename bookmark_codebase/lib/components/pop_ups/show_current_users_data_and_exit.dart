import 'package:bookmark_codebase/components/buttons/exit_button.dart';
import 'package:bookmark_codebase/components/directions/custom_directionality.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ShowCurrentUsersData extends StatelessWidget {
  final BuildContext context;

  const ShowCurrentUsersData({Key? key, required this.context})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _user = FirebaseAuth.instance.currentUser;
    String usersName = _user!.displayName ?? 'نام شما مشخص نیست';
    // String usersEmail = _user.email ?? 'ایمیل شما مشخص نیست';
    String usersImage =
        _user.photoURL ?? 'https://profiles.utdallas.edu/img/default.png';

    return RTLDirection(
      child: AlertDialog(
        content: Container(
          color: Colors.white,
          height: 270,
          width: MediaQuery.of(context).size.width * 0.8,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.white,
                      foregroundImage: NetworkImage(usersImage),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    usersName,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ],
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: ExitButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
