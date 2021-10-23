import 'package:bookmark_codebase/utils/constants/size_constants.dart';
import 'package:bookmark_codebase/utils/enums/reading_status_enums.dart';
import 'package:bookmark_codebase/utils/methods/set_by_reading_status/set_color_by_reading_status.dart';
import 'package:bookmark_codebase/utils/methods/set_by_reading_status/set_string_by_reading_status.dart';
import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class EachBookStatusCard extends StatelessWidget {
  final ReadingStatus readingStatus;
  final int numberOfBooks;
  final List books;

  const EachBookStatusCard(
      {Key? key,
      required this.readingStatus,
      required this.numberOfBooks,
      this.books = const []})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    String numOfBooks = numberOfBooks.toString();

    return Container(
      margin: const EdgeInsets.only(bottom: 16, top: 8),
      child: Column(
        children: [
          Row(
            children: [
              const SizedBox(
                width: 4,
              ),
              Text(setStringByReadingStatus(readingStatus),
                  style: Theme.of(context).textTheme.bodyText1),
              const SizedBox(
                width: 4,
              ),
              Text('($numberOfBooks)')
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            height: Sizes.booksStatusCardHeight,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: setColorByReadingStatus(readingStatus),
            ),
          ),
        ],
      ),
    );
  }
}
