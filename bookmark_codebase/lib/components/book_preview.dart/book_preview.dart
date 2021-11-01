import 'package:bookmark_codebase/business_logic/models/objects/book.dart';
import 'package:bookmark_codebase/components/book_containers/book_cover.dart';
import 'package:bookmark_codebase/components/directions/custom_directionality.dart';
import 'package:bookmark_codebase/components/rating/read_only_rating_bar.dart';
import 'package:bookmark_codebase/utils/constants/color_constants.dart';
import 'package:bookmark_codebase/utils/constants/size_constants.dart';
import 'package:bookmark_codebase/utils/methods/angles/rotate_widge_180_degrees.dart';
import 'package:flutter/material.dart';

class BookPreview extends StatelessWidget {
  final Book book;
  const BookPreview({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return RTLDirection(
      child: Scaffold(
          // backgroundColor: MyColors.bone,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: MyColors.blue),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: Sizes.fromBottom),
                Center(
                  child: SizedBox(
                    height: size.height * 0.25,
                    width: size.width * 0.3,
                    child: BookCover(
                      name: book.name,
                      image: book.image,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  book.name,
                  style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .apply(color: Colors.black),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(book.author),
                const SizedBox(
                  height: 8,
                ),
                Rotator180(
                  child: ReadOnlyRatingBar(
                    rating: book.rate,
                  ),
                )
              ],
            ),
          )),
    );
  }
}
