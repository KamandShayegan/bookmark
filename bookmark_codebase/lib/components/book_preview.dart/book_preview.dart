import 'package:bookmark_codebase/business_logic/models/objects/book.dart';
import 'package:bookmark_codebase/business_logic/models/objects/book_preview_button_stat.dart';
import 'package:bookmark_codebase/business_logic/services/http_services/requests.dart';
import 'package:bookmark_codebase/business_logic/services/providers/bookshelf/handle_bookshelves.dart';
import 'package:bookmark_codebase/components/book_containers/book_cover.dart';
import 'package:bookmark_codebase/components/buttons/button_example.dart';
import 'package:bookmark_codebase/components/buttons/button.dart';
import 'package:bookmark_codebase/components/directions/custom_directionality.dart';
import 'package:bookmark_codebase/components/floating_action_buttons/book_preview_floating_action_button.dart';
import 'package:bookmark_codebase/components/modal_sheets/starting_a_book.dart';
import 'package:bookmark_codebase/components/progress_indicators/circular/custom_circular_progress_indicator.dart';
import 'package:bookmark_codebase/components/rating/read_only_rating_bar.dart';
import 'package:bookmark_codebase/utils/constants/color_constants.dart';
import 'package:bookmark_codebase/utils/constants/size_constants.dart';
import 'package:bookmark_codebase/utils/enums/reading_status_enums.dart';
import 'package:bookmark_codebase/utils/methods/actions_on_lists/actions_on_lists.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

class Preview extends StatefulWidget {
  final Book book;
  final ReadingStatus readingStatus;

  const Preview({Key? key, required this.book, required this.readingStatus})
      : super(key: key);

  @override
  State<Preview> createState() => _PreviewState();
}

class _PreviewState extends State<Preview> {
  String description = '';
  bool isAlreadyInReadingList = false;
  bool errorLoadingDescription = false;
  BookPreviewButtonStat bookPreviewButtonStat = BookPreviewButtonStat(
      started: false, goingToStart: false, readBefore: false);

  _fetchPreview() async {
    String id = widget.book.id;
    String book = 'book/';
    String bookName1 = widget.book.name.replaceAll('&', '');
    String bookName = bookName1.replaceAll(' ', '-');
    String customTrim = bookName.replaceAll('--', '-');
    String jsonConcatenated = '$customTrim.json?';
    String temp = 'id=$id&name=$bookName';
    String url = '$book$id/$jsonConcatenated$temp';
    // print(url);
    try {
      Response response = await HttpRequests().getRequest(url);
      print(response.data);
      if (response.data.toString() == '{"notFound":true}' ||
          response.data['pageProps'] == null ||
          response.data['pageProps']['bookPage'] == null
      ) {
        description = 'خلاصه ای پیدا نشد.';
      } else {
        print('found');
        description =
        response.data['pageProps']['bookPage']['book']['description'];
      }
      setState(() {});
    } on DioError catch (e) {
      print('problem');
      description = 'خلاصه ای پیدا نشد.';
      errorLoadingDescription = true;
      setState(() {});
    }
  }

  @override
  void initState() {
    _fetchPreview();
    super.initState();
  }

  // BookPreviewButtonStat handlingButtonStats(ReadingStatus readingStatus, Book book, HandlingBookshelvesProvider wModel) {
  //   List<Book> listToCheck=[];
  //   bool isInList = false;
  //   switch(readingStatus){
  //     case ReadingStatus.readBefore:
  //       listToCheck = wModel.readBefore;
  //       break;
  //     case ReadingStatus.goingToRead:
  //       listToCheck = wModel.goingToRead;
  //       break;
  //     case ReadingStatus.isReading:
  //       listToCheck=wModel.isReading;
  //       break;
  //     case ReadingStatus.none:
  //       break;
  //   }
  //   isInList = ActionsOnLists().isBookInTheList(widget.book, listToCheck)!;
  //   if(isInList && readingStatus==ReadingStatus.readBefore){
  //     return BookPreviewButtonStat(started: true, goingToStart: true, readBefore: false);
  //   }else if(isInList && readingStatus==ReadingStatus.goingToRead){
  //     return BookPreviewButtonStat(started: true, goingToStart: false, readBefore: false);
  //   }else if(isInList && readingStatus==ReadingStatus.isReading){
  //     return BookPreviewButtonStat(started: false, goingToStart: true, readBefore: false);
  //   }elsez{
  //     return BookPreviewButtonStat(started: true, goingToStart: false, readBefore: false);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    var wModel = context.watch<HandlingBookshelvesProvider>();
    isAlreadyInReadingList =
    ActionsOnLists().isBookInTheList(widget.book, wModel.isReading)!;
    print('book is in reading list: $isAlreadyInReadingList');
    setState(() {});
    var size = MediaQuery
        .of(context)
        .size;
    return RTLDirection(
      child: Scaffold(
        // backgroundColor: MyColors.bone,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: MyColors.blue),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: [
            Container(
              margin: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
              child: Button(
                isOn: !isAlreadyInReadingList,
                width: 120,
                title: Text(
                  !isAlreadyInReadingList ? 'شروع این کتاب' : ' شروع شده',
                  style: Theme
                      .of(context)
                      .textTheme
                      .caption!
                      .apply(color: Colors.white),
                ),
                onTap: () {
                  showModalBottomSheet(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      context: context,
                      builder: (BuildContext context) {
                        return StartingABook(
                          book: widget.book,
                        );
                      });
                },
                tappedColor: MyColors.blue.withOpacity(0.3),
                defaultColor: MyColors.blue.withOpacity(0.7),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: Sizes.fromBottom),
              Center(
                child: SizedBox(
                  height: size.height * 0.25,
                  width: size.width * 0.3,
                  child: BookCover(
                    name: widget.book.name,
                    image: widget.book.image,
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                widget.book.name,
                style: Theme
                    .of(context)
                    .textTheme
                    .headline3!
                    .apply(color: Colors.black),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 4,
              ),
              Text(widget.book.author),
              const SizedBox(
                height: 8,
              ),
              ReadOnlyRatingBar(
                rating: widget.book.rate,
              ),
              const SizedBox(
                height: 32,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'خلاصه',
                        style: Theme
                            .of(context)
                            .textTheme
                            .bodyText2!
                            .apply(fontWeightDelta: 4, fontSizeDelta: 1),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    description == ''
                        ? const CustomCircularProgressIndicatorWithText(
                      leadingText: 'در حال دریافت خلاصه کتاب',
                    )
                        : Text(
                      description,
                      style: Theme
                          .of(context)
                          .textTheme
                          .subtitle2!
                          .apply(heightFactor: 2),
                    ),
                    const SizedBox(
                      height: 56,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: BookPreviewFloatingActionButton(
          book: widget.book,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
