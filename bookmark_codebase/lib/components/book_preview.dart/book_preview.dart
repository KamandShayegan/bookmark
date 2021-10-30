import 'package:bookmark_codebase/business_logic/models/objects/book.dart';
import 'package:bookmark_codebase/components/book_containers/book_cover.dart';
import 'package:bookmark_codebase/components/directions/custom_directionality.dart';
import 'package:bookmark_codebase/utils/constants/color_constants.dart';
import 'package:bookmark_codebase/utils/constants/size_constants.dart';
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
                SizedBox(height: Sizes.fromBottom),
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
                SizedBox(
                  height: 8,
                ),
                Text(
                  book.name,
                  style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .apply(color: Colors.black),
                ),
              ],
            ),
          )),
    );
  }
}
