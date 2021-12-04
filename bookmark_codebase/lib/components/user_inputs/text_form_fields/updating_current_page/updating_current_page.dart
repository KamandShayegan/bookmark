import 'package:bookmark_codebase/utils/constants/color_constants.dart';
import 'package:flutter/material.dart';

class UpdatingCurrentpageTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final int currentPageAsHint;
  final int lastPage;

  const UpdatingCurrentpageTextFormField(
      {Key? key,
      required this.controller,
      required this.currentPageAsHint,
      required this.lastPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (val) {
        if (val == null || val.isEmpty) {
          return null;
        }
        // print('${int.parse(val!)}');
        if (int.parse(val) > lastPage) {
          print('wtf');
          return 'کتاب $lastPage صفحه است.';
        }
      },
      cursorWidth: 1,
      // cursorRadius: Radius.circular(10),
      showCursor: true,
      cursorColor: Colors.black,
      style: Theme.of(context).textTheme.headline5,
      decoration: InputDecoration(
        errorStyle: Theme.of(context).textTheme.subtitle1,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MyColors.bone.withOpacity(0.2))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MyColors.bone.withOpacity(0.2))),
        contentPadding: EdgeInsets.zero,
        hintText: currentPageAsHint.toString(),
        hintStyle:
            Theme.of(context).textTheme.headline5!.apply(color: Colors.grey),
      ),
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      controller: controller,
      onChanged: (value) {
        print(value);
      },
    );
  }
}
