import 'package:bookmark_codebase/business_logic/models/objects/book.dart';
import 'package:bookmark_codebase/components/book_containers/book_cover.dart';
import 'package:bookmark_codebase/utils/enums/reading_status_enums.dart';
import 'package:flutter/material.dart';

class ExpansionPanelHeader extends StatelessWidget {
  final Book book;
  final ReadingStatus readingStatus;
  const ExpansionPanelHeader({Key? key, required this.book, required this.readingStatus}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BookCover(image: book.image, name: book.name, readingStatus: readingStatus,),
        const SizedBox(
          width: 16,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(book.name),
            Text(
              book.author,
              textDirection: TextDirection.rtl,
            ),
          ],
        )
      ],
    );
  }
}
