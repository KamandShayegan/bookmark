import 'package:bookmark_codebase/business_logic/models/objects/book.dart';
import 'package:bookmark_codebase/business_logic/services/providers/bookshelf/handle_bookshelves.dart';
import 'package:bookmark_codebase/components/directions/custom_directionality.dart';
import 'package:bookmark_codebase/components/expansion_panel/expansion_panel.dart';
import 'package:bookmark_codebase/components/expansion_panel/expansion_panel_header.dart';
import 'package:bookmark_codebase/components/expansion_panel/is_reading_body.dart';
import 'package:bookmark_codebase/components/expansion_panel/read_before_body.dart';
import 'package:bookmark_codebase/utils/constants/color_constants.dart';
import 'package:bookmark_codebase/utils/enums/reading_status_enums.dart';
import 'package:bookmark_codebase/utils/methods/set_by_reading_status/set_string_by_reading_status.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExpandableCollection extends StatelessWidget {
  final ReadingStatus readingStatus;

  const ExpandableCollection(
      {Key? key, required this.readingStatus})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var wModel = context.watch<HandlingBookshelvesProvider>();
    List<Book> books = [];
    if(readingStatus==ReadingStatus.readBefore){
      books = wModel.readBefore.reversed.toList();
    }else if(readingStatus==ReadingStatus.isReading){
      books = wModel.isReading.reversed.toList();
    }
    TextTheme textTheme = Theme.of(context).textTheme;
    return RTLDirection(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            setStringByReadingStatus(readingStatus),
            style: textTheme.bodyText1!.apply(color: MyColors.blue),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: MyColors.blue),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView.builder(
              itemCount: books.length,
              itemBuilder: (context, index) {
                return ExpansionWidget(
                  readingStatus: readingStatus,
                  expansionHeader: ExpansionPanelHeader(
                    book: books[index],
                    readingStatus: readingStatus,
                  ),
                  expansionBody: readingStatus == ReadingStatus.isReading
                      ? IsReadingExpansionBody(book: books[index])
                      : ReadBeforeExpansionBody(book: books[index]),
                  book: books[index],
                );
              }),
        ),
      ),
    );
  }
}
