import 'package:bookmark_codebase/utils/constants/color_constants.dart';
import 'package:bookmark_codebase/utils/enums/reading_status_enums.dart';
import 'package:flutter/material.dart';

Color setColor(ReadingStatus stat) {
  switch (stat) {
    case ReadingStatus.readBefore:
      return MyColors.purple;
    case ReadingStatus.goingToRead:
      return MyColors.blue;
    case ReadingStatus.isReading:
      return MyColors.bone;
  }
}
