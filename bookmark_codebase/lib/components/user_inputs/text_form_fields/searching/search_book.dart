import 'package:bookmark_codebase/business_logic/services/providers/bookshelf/handle_bookshelves.dart';
import 'package:bookmark_codebase/business_logic/services/providers/search_book/search_book_provider.dart';
import 'package:bookmark_codebase/utils/constants/color_constants.dart';
import 'package:bookmark_codebase/utils/constants/svg_constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class SearchBookTextFormField extends StatefulWidget {
  final TextEditingController controller;
  const SearchBookTextFormField({Key? key, required this.controller})
      : super(key: key);

  @override
  State<SearchBookTextFormField> createState() => _SearchBookTextFormFieldState();
}

class _SearchBookTextFormFieldState extends State<SearchBookTextFormField> {

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return TextFormField(
      onChanged: (value)=>_checkLengthAndSendRequest(value, context),
      style: Theme.of(context).textTheme.headline3!.apply(color: MyColors.blue),
      // autofocus: true,
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

  _checkLengthAndSendRequest(String value, BuildContext context) async{
    if(value.length>2){
      await context.read<SearchBookProvider>().searchBook(value);
    }
  }
}
