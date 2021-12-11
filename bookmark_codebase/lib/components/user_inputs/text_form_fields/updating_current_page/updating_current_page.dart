import 'package:bookmark_codebase/business_logic/models/objects/book.dart';
import 'package:bookmark_codebase/business_logic/services/providers/bookshelf/handle_bookshelves.dart';
import 'package:bookmark_codebase/utils/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdatingCurrentPageTextFormField extends StatefulWidget {
  final Book book;
  final TextEditingController controller;
  final int currentPageAsHint;
  final int lastPage;

  const UpdatingCurrentPageTextFormField(
      {Key? key,
      required this.controller,
      required this.currentPageAsHint,
      required this.lastPage,
      required this.book})
      : super(key: key);

  @override
  State<UpdatingCurrentPageTextFormField> createState() =>
      _UpdatingCurrentPageTextFormFieldState();
}

class _UpdatingCurrentPageTextFormFieldState
    extends State<UpdatingCurrentPageTextFormField> {
  @override
  Widget build(BuildContext context) {
    bool updatePercentIndicator = true;
    return TextFormField(
      validator: (val) {
        if (val == null || val.isEmpty) {
          return null;
        }
        // print('${int.parse(val!)}');
        if (int.parse(val) > widget.lastPage) {
          updatePercentIndicator = false;
          return 'کتاب ${widget.lastPage} صفحه است.';
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
        hintText: widget.currentPageAsHint.toString(),
        hintStyle:
            Theme.of(context).textTheme.headline5!.apply(color: Colors.grey),
      ),
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      controller: widget.controller,
      onChanged: (value) {
        if (value.isNotEmpty) {
          var rModel = context.read<HandlingBookshelvesProvider>();
          rModel.localCurPage = int.parse(value);
        }
      },
    );
  }
}
