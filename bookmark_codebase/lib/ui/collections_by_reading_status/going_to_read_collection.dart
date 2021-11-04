import 'package:bookmark_codebase/business_logic/models/objects/book.dart';
import 'package:bookmark_codebase/business_logic/services/providers/bookshelf/handle_bookshelves.dart';
import 'package:bookmark_codebase/components/decorated_containers/going_to_read_container.dart';
import 'package:bookmark_codebase/components/directions/custom_directionality.dart';
import 'package:bookmark_codebase/components/dismissible/dismissible_background.dart';
import 'package:bookmark_codebase/components/pop_ups/before_deletion_assurance.dart';
import 'package:bookmark_codebase/components/progress_indicators/circular/custom_circular_progress_indicator.dart';
import 'package:bookmark_codebase/utils/constants/color_constants.dart';
import 'package:bookmark_codebase/utils/constants/string_constants.dart';
import 'package:bookmark_codebase/utils/enums/reading_status_enums.dart';
import 'package:bookmark_codebase/utils/methods/set_by_reading_status/set_string_by_reading_status.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GoingToReadCollection extends StatefulWidget {
  final List<Book> books;
  const GoingToReadCollection({Key? key, required this.books})
      : super(key: key);

  @override
  State<GoingToReadCollection> createState() => _GoingToReadCollectionState();
}

class _GoingToReadCollectionState extends State<GoingToReadCollection> {
  bool load = false;
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    var rModel = context.read<HandlingBookshelvesProvider>();
    ReadingStatus readingStatus = ReadingStatus.goingToRead;

    // _onDismissed(int index) async {
    //   setState(() {
    //     // rModel.goingToRead.removeAt(i);
    //   });
    // }

    return RTLDirection(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text(
            setStringByReadingStatus(readingStatus),
            style: textTheme.bodyText1!.apply(color: MyColors.blue),
          ),
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: MyColors.blue),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              load
                  ? CustomCircularProgressIndicator(
                      readingStatus: readingStatus,
                      leadingText: StringConstants.startBook,
                    )
                  : Expanded(
                      child: ListView.builder(
                        itemCount: rModel.goingToRead.length,
                        itemBuilder: (builder, i) {
                          return Dismissible(
                            direction: DismissDirection.endToStart,
                            background: DismissibleBackground(
                                readingStatus: readingStatus),
                            confirmDismiss: (_) async {
                              return await showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return BeforeDeletionAssurance(
                                      readingStatus: readingStatus, index: i);
                                },
                              );
                            },
                            key: UniqueKey(),
                            // onDismissed: (_) => _onDismissed(i),
                            child: GoingToReadContainer(
                              onTap: () async {
                                setState(() {
                                  load = true;
                                });
                                await _addBook(context, widget.books[i]);
                                setState(() {
                                  load = false;
                                });
                              },
                              book: widget.books[i],
                            ),
                          );
                        },
                      ),
                    ),
              // ...books.map((e) {
              //   return GoingToReadContainer(onTap: () {}, book: e);
              // }
              // )
            ],
          ),
        ),
      ),
    );
  }

  _addBook(BuildContext context, Book book) async {
    //api call
    var rModel = context.read<HandlingBookshelvesProvider>();
    rModel.startReading(book);
    await Future.delayed(const Duration(seconds: 2));
  }
}
