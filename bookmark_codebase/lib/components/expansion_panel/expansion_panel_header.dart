import 'package:bookmark_codebase/business_logic/models/objects/book.dart';
import 'package:bookmark_codebase/components/book_containers/book_cover.dart';
import 'package:flutter/material.dart';

class ExpansionPanelHeader extends StatelessWidget {
  final Book book;
  const ExpansionPanelHeader({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BookCover(image: book.image, name: book.name),
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
