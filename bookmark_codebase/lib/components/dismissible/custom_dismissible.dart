import 'package:bookmark_codebase/business_logic/models/objects/book.dart';
import 'package:bookmark_codebase/components/dismissible/dismissible_background.dart';
import 'package:bookmark_codebase/components/pop_ups/before_deletion_alert_dialogs/before_deletion_assurance.dart';
import 'package:bookmark_codebase/utils/constants/svg_constants.dart';
import 'package:bookmark_codebase/utils/enums/reading_status_enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CustomDismissible extends StatefulWidget {
  final ReadingStatus readingStatus;
  final Book book;
  final Widget child;
  const CustomDismissible({Key? key, required this.readingStatus, required this.book, required this.child}) : super(key: key);

  @override
  State<CustomDismissible> createState() => _CustomDismissibleState();
}

class _CustomDismissibleState extends State<CustomDismissible> {
  bool load = true;
  @override
  Widget build(BuildContext context) {
     return Dismissible(
      direction: DismissDirection.endToStart,
      background: DismissibleBackground(
          readingStatus: widget.readingStatus),
      confirmDismiss: (_) async {
        return await showDialog(
          context: context,
          builder: (BuildContext context) {
            return BeforeDeletionAssurance(
                readingStatus: widget.readingStatus, book: widget.book);
          },
        );
      },
      key: UniqueKey(),
      // onDismissed: (_) => _onDismissed(i),
      child: widget.child,
    );
  }
}
