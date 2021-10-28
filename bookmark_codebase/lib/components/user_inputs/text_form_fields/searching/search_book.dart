import 'package:bookmark_codebase/utils/constants/color_constants.dart';
import 'package:bookmark_codebase/utils/constants/svg_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchBookTextFormField extends StatelessWidget {
  final TextEditingController controller;
  const SearchBookTextFormField({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return TextFormField(
      style: Theme.of(context).textTheme.headline3!.apply(color: MyColors.blue),
      autofocus: true,
      cursorColor: MyColors.blue,
      decoration: InputDecoration(
        hintText: 'کتاب مورد نظر خود را جستجو کنید...',
        hintStyle:
            Theme.of(context).textTheme.subtitle2!.apply(color: MyColors.blue),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: MyColors.blue,
          ),
        ),
        icon: SvgPicture.asset(
          SvgPaths.search,
          height: size.height * 0.032,
          color: MyColors.blue,
        ),
      ),
    );
  }
}
