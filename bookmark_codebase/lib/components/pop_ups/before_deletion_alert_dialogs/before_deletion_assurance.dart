import 'package:bookmark_codebase/business_logic/models/objects/book.dart';
import 'package:bookmark_codebase/business_logic/services/providers/bookshelf/handle_bookshelves.dart';
import 'package:bookmark_codebase/components/buttons/button.dart';
import 'package:bookmark_codebase/components/directions/custom_directionality.dart';
import 'package:bookmark_codebase/utils/constants/color_constants.dart';
import 'package:bookmark_codebase/utils/constants/svg_constants.dart';
import 'package:bookmark_codebase/utils/enums/reading_status_enums.dart';
import 'package:bookmark_codebase/utils/methods/set_by_reading_status/set_color_by_reading_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class BeforeDeletionAssurance extends StatelessWidget {
  final ReadingStatus readingStatus;
  final Book book;
  const BeforeDeletionAssurance(
      {Key? key, required this.readingStatus, required this.book})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var wModel = context.watch<HandlingBookshelvesProvider>();

    _deleteBook() {
      wModel.removeBook(readingStatus, book);
    }

    return RTLDirection(
      child: AlertDialog(
        title: SvgPicture.asset(
          SvgPaths.trash,
          color: setColorByReadingStatus(readingStatus),
          height: 32,
        ),
        content: const Text(
          "حذف کنم؟",
          textAlign: TextAlign.center,
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: <Widget>[
          Button(
            width: 80,
            onTap: () {
              _deleteBook();
              Navigator.of(context).pop(true);
            },
            title: Text(
              'آره',
              style: Theme.of(context).textTheme.caption!.apply(color: Colors.black),),
            defaultColor: Colors.white,
            tappedColor: MyColors.blue,
          ),
          Button(
            width: 80,
            title: Text(
          'نه',
          style: Theme.of(context).textTheme.caption!.apply(color: Colors.black),),
            onTap: () => Navigator.of(context).pop(false),
            defaultColor: MyColors.blue.withOpacity(0.3),
            tappedColor: MyColors.blue,
          ),
        ],
      ),
    );
  }
}
