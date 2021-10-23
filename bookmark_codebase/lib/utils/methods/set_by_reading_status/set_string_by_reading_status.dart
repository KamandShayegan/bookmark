import 'package:bookmark_codebase/utils/enums/reading_status_enums.dart';

String setStringByReadingStatus(ReadingStatus readingStatus) {
  String? stat;
  switch (readingStatus) {
    case ReadingStatus.readBefore:
      stat = 'قبلا خوندم';
      break;
    case ReadingStatus.goingToRead:
      stat = 'میخوام بخونم';
      break;
    case ReadingStatus.isReading:
      stat = 'دارم میخونم';
      break;
    default:
      stat = 'نامشخص';
  }
  return stat;
}
