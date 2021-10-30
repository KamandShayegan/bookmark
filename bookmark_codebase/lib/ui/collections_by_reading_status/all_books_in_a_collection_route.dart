import 'package:bookmark_codebase/business_logic/services/providers/bookshelf/handle_bookshelves.dart';
import 'package:bookmark_codebase/components/directions/custom_directionality.dart';
import 'package:bookmark_codebase/components/expansion_panel/expansion_panel.dart';
import 'package:bookmark_codebase/utils/constants/color_constants.dart';
import 'package:bookmark_codebase/utils/constants/size_constants.dart';
import 'package:bookmark_codebase/utils/enums/reading_status_enums.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllBooksInACollection extends StatelessWidget {
  final ReadingStatus readingStatus;
  const AllBooksInACollection({Key? key, required this.readingStatus})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var readModel = context.read<HandlingBookshelvesProvider>();
    List bookList = _determineListByReadingStatus(readingStatus, readModel);
    return RTLDirection(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: MyColors.blue),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 24,
              ),
              ...bookList.map((e) {
                return ExpansionWidget(
                    readingStatus: readingStatus,
                    expansionHeader: Text(e.name),
                    expansionBody: Text(e.author));
              }),
            ],
          ),
        ),
      ),
    );
  }

  List _determineListByReadingStatus(
      ReadingStatus readingStatus, HandlingBookshelvesProvider readModel) {
    switch (readingStatus) {
      case ReadingStatus.readBefore:
        return readModel.readBefore;
      case ReadingStatus.goingToRead:
        return readModel.goingToRead;
      case ReadingStatus.isReading:
        return readModel.isReading;
    }
  }
}
