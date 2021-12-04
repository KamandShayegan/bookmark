import 'package:bookmark_codebase/utils/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CustomCircularPercentIndicator extends StatelessWidget {
  final double progress;
  const CustomCircularPercentIndicator({Key? key, required this.progress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      circularStrokeCap: CircularStrokeCap.round,
      backgroundColor: Colors.grey.withOpacity(0.1),
      radius: 130.0,
      lineWidth: 15.0,
      percent: progress,
      // center: new Text("100%"),
      progressColor: MyColors.bone,
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
