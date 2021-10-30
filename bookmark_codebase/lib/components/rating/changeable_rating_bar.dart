import 'package:bookmark_codebase/utils/constants/color_constants.dart';
import 'package:bookmark_codebase/utils/constants/numbers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ChangeableRatingBar extends StatefulWidget {
  const ChangeableRatingBar({Key? key}) : super(key: key);

  @override
  _ChangeableRatingBarState createState() => _ChangeableRatingBarState();
}

class _ChangeableRatingBarState extends State<ChangeableRatingBar> {
  double rate = 0.0;
  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      glow: true,
      glowColor: Colors.white,
      itemSize: 16,
      initialRating: 0,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: false,
      itemCount: Numbers.numberOfStarsForRating,
      itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: MyColors.ratingStars,
      ),
      onRatingUpdate: (newRating) {
        setState(() {
          rate = newRating;
        });
      },
    );
  }
}
