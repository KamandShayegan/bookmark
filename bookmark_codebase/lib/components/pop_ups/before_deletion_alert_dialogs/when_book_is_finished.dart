import 'package:bookmark_codebase/business_logic/models/objects/book.dart';
import 'package:bookmark_codebase/business_logic/services/providers/bookshelf/handle_bookshelves.dart';
import 'package:bookmark_codebase/components/buttons/button.dart';
import 'package:bookmark_codebase/components/directions/custom_directionality.dart';
import 'package:bookmark_codebase/utils/constants/svg_constants.dart';
import 'package:bookmark_codebase/utils/enums/reading_status_enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class FinishedBookAlertDialog extends StatefulWidget {
  final Book book;

  const FinishedBookAlertDialog({Key? key, required this.book})
      : super(key: key);

  @override
  State<FinishedBookAlertDialog> createState() =>
      _FinishedBookAlertDialogState();
}

class _FinishedBookAlertDialogState extends State<FinishedBookAlertDialog> {
  @override
  Widget build(BuildContext context) {
    var textTheme =
    Theme.of(context).textTheme.subtitle2!.apply(color: Colors.white);
    var wModel = context.watch<HandlingBookshelvesProvider>();
    _removeBookFromReading() {
      wModel.setFinishedDate(widget.book);
      wModel.addBook(ReadingStatus.readBefore, widget.book);
      wModel.removeBook(ReadingStatus.isReading, widget.book);
    }

    return RTLDirection(
      child: AlertDialog(
        title: Column(
          children: [
            SvgPicture.asset(
              SvgPaths.confetti,
              height: 48,
            ),
            const SizedBox(
              height: 8,
            ),
            const Text('تموم؟'),
          ],
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          Button(
              title: Text(
                'آره',
                style: textTheme,
              ),
              onTap: () {
                _removeBookFromReading();
                Navigator.of(context).pop(true);
              },
              width: 60),
          Button(
            title: Text(
              'نه',
              style: textTheme,
            ),
            onTap: () {
              Navigator.of(context).pop(false);
            },
            width: 60,
          ),
        ],
      ),
    );
  }
}
