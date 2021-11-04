import 'package:bookmark_codebase/business_logic/models/objects/book.dart';
import 'package:bookmark_codebase/components/book_containers/each_book.dart';
import 'package:bookmark_codebase/utils/enums/reading_status_enums.dart';
import 'package:flutter/material.dart';

class BooksRow extends StatelessWidget {
  final List<Book> books;
  final ReadingStatus readingStatus;
  const BooksRow({Key? key, this.books = const [], required this.readingStatus}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...books.map((e) {
            return EachBook(book: e, readingStatus: readingStatus);
          }),
        ],
      ),
    );
  }
}
