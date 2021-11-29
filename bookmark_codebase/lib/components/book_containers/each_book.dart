import 'package:bookmark_codebase/business_logic/models/objects/book.dart';
import 'package:bookmark_codebase/components/book_containers/book_cover.dart';
import 'package:bookmark_codebase/components/book_preview.dart/book_preview.dart';
import 'package:bookmark_codebase/utils/constants/color_constants.dart';
import 'package:bookmark_codebase/utils/enums/reading_status_enums.dart';
import 'package:flutter/material.dart';

class EachBook extends StatelessWidget {
  final Book book;
  final ReadingStatus readingStatus;

  const EachBook({Key? key, required this.book, required  this.readingStatus}) : super(key: key);

  _showPreview(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => Preview(
          book: book,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => _showPreview(context),
      child: Container(
        // height: size.height * 0.,
        // height: ,
        width: size.width * 0.14,
        margin: const EdgeInsets.only(right: 8, left: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BookCover(image: book.image, name: book.name, readingStatus: readingStatus),
            const SizedBox(height: 4),
            Text(book.name,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .overline!
                    .apply(color: MyColors.blue)),
          ],
        ),
      ),
    );
  }
}
