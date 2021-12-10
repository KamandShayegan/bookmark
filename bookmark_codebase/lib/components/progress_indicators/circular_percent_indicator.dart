import 'package:bookmark_codebase/utils/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CustomCircularPercentIndicator extends StatefulWidget {
  final double progress;

  const CustomCircularPercentIndicator({Key? key, required this.progress})
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
    if (widget.progress == 1.0) {
      color = Colors.green;
      isDone = true;
      //Show pop up with confetti and congratulate the user for ending the book.
      //add the book to {readBefore} list and remove from here.
      //show 0.5 sec delay so the user can see the green percent indicator and the check in the middle.
      setState(() {});
    }
    return CircularPercentIndicator(
      circularStrokeCap: CircularStrokeCap.round,
      backgroundColor: Colors.grey.withOpacity(0.1),
      radius: 130.0,
      lineWidth: 15.0,
      percent: widget.progress,
      center: isDone
          ? const Icon(
              Icons.check,
              color: Colors.green,
              size: 40,
            )
          : null,
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
