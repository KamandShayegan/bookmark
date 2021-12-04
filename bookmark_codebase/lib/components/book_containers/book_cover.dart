 import 'package:bookmark_codebase/components/progress_indicators/circular/custom_circular_progress_indicator.dart';
import 'package:bookmark_codebase/utils/constants/color_constants.dart';
import 'package:bookmark_codebase/utils/enums/reading_status_enums.dart';
import 'package:bookmark_codebase/utils/methods/set_by_reading_status/set_color_by_reading_status.dart';
import 'package:flutter/material.dart';

class BookCover extends StatelessWidget {
  final String image;
  final String name;
  final ReadingStatus readingStatus;


  const BookCover({
    Key? key,
    required this.image,
    required this.name, this.readingStatus= ReadingStatus.goingToRead,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return image == ''
        ? _makeBookCover('بدون عکس', context)
        : SizedBox(
            // decoration: BoxDecoration(
            //     // border: Border.all(color: Colors.black),
            //     ),
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width * 0.14,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.network(
                image,
                fit: BoxFit.contain,
                // loadingBuilder: (context, widget, _) => Center(
                //   child: SizedBox(
                //     height: 8,
                //     width: 8,
                //     child: CircularProgressIndicator(
                //       color: setColorByReadingStatus(readingStatus).withOpacity(0.3),
                //     ),
                //   ),
                // ),
                errorBuilder: (context, obj, _) => Text('عکس پیدا نشد',
                    style: Theme.of(context).textTheme.overline),
              ),
            ),
          );
  }

  Widget _makeBookCover(String name, BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        height: size.height * 0.1,
        // height: 40,s
        width: size.width * 0.12,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: MyColors.blue),
        ),
        child: Center(
          child: Text(
            name,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context)
                .textTheme
                .overline!
                .apply(color: MyColors.blue),
          ),
        ),
      ),
    );
  }
}
