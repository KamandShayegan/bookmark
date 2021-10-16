import 'package:codebase/utils/enums/reading_status_enums.dart';
import 'package:codebase/utils/methods/set_color.dart';
import 'package:flutter/material.dart';

class ExpansionWidget extends StatefulWidget {
  final ReadingStatus readingStatus;
  final Widget expansionHeader;
  final Widget expansionBody;
  const ExpansionWidget(
      {Key? key,
      required this.readingStatus,
      required this.expansionHeader,
      required this.expansionBody})
      : super(key: key);

  @override
  _ExpansionWidgetState createState() => _ExpansionWidgetState();
}

class _ExpansionWidgetState extends State<ExpansionWidget> {
  bool _isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 3,
          color: setColor(widget.readingStatus),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ExpansionPanelList(
          elevation: 0,
          animationDuration: const Duration(microseconds: 500),
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
    );
  }
}
