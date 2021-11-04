import 'package:bookmark_codebase/utils/enums/reading_status_enums.dart';
import 'package:bookmark_codebase/utils/methods/set_by_reading_status/set_color_by_reading_status.dart';
import 'package:flutter/material.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  final ReadingStatus readingStatus;
  final String leadingText;
  const CustomCircularProgressIndicator(
      {Key? key, required this.readingStatus, this.leadingText = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = setColorByReadingStatus(readingStatus);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 40,
          ),
          CircularProgressIndicator(
            color: color,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            leadingText,
            style: Theme.of(context).textTheme.headline2!.apply(color: color),
          ),
        ],
      ),
    );
  }
}
