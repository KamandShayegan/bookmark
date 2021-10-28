import 'package:bookmark_codebase/business_logic/models/objects/book.dart';
import 'package:bookmark_codebase/business_logic/services/providers/bookshelf/handle_bookshelves.dart';
import 'package:bookmark_codebase/components/pop_ups/add_comment/add_comment.dart';
import 'package:bookmark_codebase/ui/collections_by_reading_status/books_row.dart';
import 'package:bookmark_codebase/utils/constants/size_constants.dart';
import 'package:bookmark_codebase/utils/constants/svg_constants.dart';
import 'package:bookmark_codebase/utils/enums/reading_status_enums.dart';
import 'package:bookmark_codebase/utils/methods/set_by_reading_status/set_color_by_reading_status.dart';
import 'package:bookmark_codebase/utils/methods/set_by_reading_status/set_string_by_reading_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class EachBookStatusCard extends StatelessWidget {
  final ReadingStatus readingStatus;

  EachBookStatusCard({
    Key? key,
    required this.readingStatus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Book> books = _setBookShelf(readingStatus, context);
    var size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        showDialog(context: context, builder: (_) => const AddComment());
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16, top: 8),
        child: Column(
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 8,
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      _setSVG(readingStatus),
                      color: setColorByReadingStatus(readingStatus),
                      height:
                          (readingStatus == ReadingStatus.readBefore) ? 22 : 24,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                  ],
                ),
                Text(setStringByReadingStatus(readingStatus),
                    style: Theme.of(context).textTheme.subtitle2),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  "(${books.length.toString()})",
                  style: Theme.of(context).textTheme.headline5,
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Card(
              shadowColor: setColorByReadingStatus(readingStatus),
              elevation: 5,
              child: Container(
                padding: const EdgeInsets.all(8),
                height: size.height * 0.15,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  // color: setColorByReadingStatus(readingStatus),
                ),
                child: BooksRow(
                  books: books,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _setSVG(ReadingStatus readingStatus) {
    return (readingStatus == ReadingStatus.isReading)
        ? SvgPaths.feather
        : (readingStatus == ReadingStatus.goingToRead)
            ? SvgPaths.inbox
            : SvgPaths.archive;
  }

  List<Book> _setBookShelf(ReadingStatus readingStatus, BuildContext context) {
    var watch = context.watch<HandlingBookshelvesProvider>();
    switch (readingStatus) {
      case ReadingStatus.readBefore:
        return watch.readBefore;
      case ReadingStatus.goingToRead:
        return watch.goingToRead;
      case ReadingStatus.isReading:
        return watch.isReading;
    }
  }
}
