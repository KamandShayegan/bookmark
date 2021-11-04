import 'package:bookmark_codebase/utils/constants/svg_constants.dart';
import 'package:bookmark_codebase/utils/enums/reading_status_enums.dart';
import 'package:bookmark_codebase/utils/methods/set_by_reading_status/set_color_by_reading_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DismissibleBackground extends StatelessWidget {
  final ReadingStatus readingStatus;
  const DismissibleBackground({Key? key, required this.readingStatus})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = setColorByReadingStatus(readingStatus);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      // color: color.withOpacity(0.1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          SvgPicture.asset(
            SvgPaths.trash,
            color: color,
          ),
          // SvgPicture.asset(
          //   SvgPaths.trash,
          //   color: color,
          // ),
        ],
      ),
    );
  }
}
