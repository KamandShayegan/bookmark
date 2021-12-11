
import 'package:shamsi_date/shamsi_date.dart';

class DateTimeCalculations{

  String dateTimeToJalaliWithFormattedResult(DateTime dateTime){
    Gregorian g = Gregorian.fromDateTime(dateTime);
    Jalali j = g.toJalali();
    return '${j.day} / ${j.month} / ${j.year}';
  }
}