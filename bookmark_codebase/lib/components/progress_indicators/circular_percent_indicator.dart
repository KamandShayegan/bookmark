import 'package:bookmark_codebase/business_logic/models/objects/book.dart';
import 'package:bookmark_codebase/components/pop_ups/before_deletion_alert_dialogs/when_book_is_finished.dart';
import 'package:bookmark_codebase/utils/constants/color_constants.dart';
import 'package:bookmark_codebase/utils/methods/actions_on_page_counts/actions_on_page_counts.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CustomCircularPercentIndicator extends StatefulWidget {
  final Book book;

  const CustomCircularPercentIndicator({Key? key, required this.book})
      : super(key: key);

  @override
  State<CustomCircularPercentIndicator> createState() =>
      _CustomCircularPercentIndicatorState();
}

class _CustomCircularPercentIndicatorState
    extends State<CustomCircularPercentIndicator> {
  Color color = MyColors.bone;
  bool isDone = false;

  @override
  Widget build(BuildContext context) {
    double progress = ActionsOnPageCounts().calculateBookProgressFrom1(
        widget.book.currentPage, widget.book.pageCount);
    if (progress == 1.0) {
      color = Colors.green;
      isDone = true;

      //Show pop up with confetti and congratulate the user for ending the book.
      //add the book to {readBefore} list and remove from here.
      //show 0.5 sec delay so the user can see the green percent indicator and the check in the middle.
      // setState(() {});
    }
    return CircularPercentIndicator(
      circularStrokeCap: CircularStrokeCap.round,
      backgroundColor: Colors.grey.withOpacity(0.1),
      radius: 130.0,
      lineWidth: 15.0,
      percent: progress,
      center: isDone
          ? const Icon(
              Icons.check,
              color: Colors.green,
              size: 40,
            )
          : Text(
              '${widget.book.pageCount} / ${widget.book.currentPage}',
              style: Theme.of(context).textTheme.headline5!.apply(color: Colors.grey),
            ),
      progressColor: color,
      startAngle: 270,
      // linearGradient: LinearGradient(
      //   colors: [
      //     MyColors.bone,
      //     MyColors.bone.withOpacity(0.5),
      //   ],
      // ),
      animation: true,
      animationDuration: 1000,
      animateFromLastPercent: true,
      curve: Curves.linear,

      // arcBackgroundColor: Colors.red,
      // arcType: ArcType.FULL,
    );
  }
}
