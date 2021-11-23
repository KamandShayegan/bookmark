import 'package:bookmark_codebase/utils/constants/color_constants.dart';
import 'package:bookmark_codebase/utils/constants/numbers.dart';
import 'package:bookmark_codebase/utils/constants/size_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReadOnlyRatingBar extends StatelessWidget {
  final double rating;

  const ReadOnlyRatingBar({Key? key, required this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      unratedColor: Colors.grey.withOpacity(0.4),
      rating: rating,
      itemBuilder: (context, index) => const Icon(
        Icons.star,
        color: MyColors.ratingStars,
      ),
      itemCount: Numbers.numberOfStarsForRating,
      itemSize: Sizes.starSizeForRating,
      direction: Axis.horizontal,
    );
  }
}
