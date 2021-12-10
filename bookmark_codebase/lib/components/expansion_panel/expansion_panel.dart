import 'package:bookmark_codebase/business_logic/models/objects/book.dart';
import 'package:bookmark_codebase/components/dismissible/custom_dismissible.dart';
import 'package:bookmark_codebase/utils/enums/reading_status_enums.dart';
import 'package:bookmark_codebase/utils/methods/set_by_reading_status/set_color_by_reading_status.dart';
import 'package:flutter/material.dart';

class ExpansionWidget extends StatefulWidget {
  final ReadingStatus readingStatus;
  final Widget expansionHeader;
  final Widget expansionBody;
  final Book book;
  const ExpansionWidget(
      {Key? key,
      required this.readingStatus,
      required this.expansionHeader,
      required this.expansionBody, required this.book})
      : super(key: key);

  @override
  _ExpansionWidgetState createState() => _ExpansionWidgetState();
}

class _ExpansionWidgetState extends State<ExpansionWidget> {
  bool _isOpen = false;

  @override
  Widget build(BuildContext context) {
    return CustomDismissible(
      book: widget.book,
      readingStatus: widget.readingStatus,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(
            width: 3,
            color: setColorByReadingStatus(widget.readingStatus),
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: ExpansionPanelList(
            elevation: 0,
            animationDuration: const Duration(seconds: 1),
            expansionCallback: (i, isOpen) {
              setState(() {
                _isOpen = !isOpen;
              });
            },
            children: [
              ExpansionPanel(
                canTapOnHeader: true,
                headerBuilder: (context, isOpen) {
                  return widget.expansionHeader;
                },
                body: widget.expansionBody,
                isExpanded: _isOpen,
              ),
            ]),
      ),
    );
  }
}
