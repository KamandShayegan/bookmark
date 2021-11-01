import 'package:bookmark_codebase/business_logic/models/objects/book.dart';
import 'package:bookmark_codebase/components/directions/custom_directionality.dart';
import 'package:bookmark_codebase/components/expansion_panel/expansion_panel.dart';
import 'package:bookmark_codebase/components/expansion_panel/expansion_panel_header.dart';
import 'package:bookmark_codebase/utils/constants/color_constants.dart';
import 'package:bookmark_codebase/utils/enums/reading_status_enums.dart';
import 'package:bookmark_codebase/utils/methods/set_by_reading_status/set_string_by_reading_status.dart';
import 'package:flutter/material.dart';

class ExpandableCollection extends StatelessWidget {
  final ReadingStatus readingStatus;
  final List<Book> books;
  const ExpandableCollection(
      {Key? key, required this.readingStatus, required this.books})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 24,
                ),
                ...books.map(
                  (e) {
                    return ExpansionWidget(
                      readingStatus: readingStatus,
                      expansionHeader: ExpansionPanelHeader(book: e),
                      expansionBody:
                          const Text('اطلاعات بیشتری هنوز در دسترس نیست.'),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
