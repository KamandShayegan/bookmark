import 'package:bookmark_codebase/business_logic/models/json_2_dart/search_result.dart'
    as searched;
import 'package:bookmark_codebase/business_logic/services/providers/search_book/search_book_provider.dart';
import 'package:bookmark_codebase/components/book_containers/book_cover.dart';
import 'package:bookmark_codebase/components/book_containers/each_searched_book.dart';
import 'package:bookmark_codebase/components/directions/custom_directionality.dart';
import 'package:bookmark_codebase/components/progress_indicators/circular/custom_circular_progress_indicator.dart';
import 'package:bookmark_codebase/components/rating/read_only_rating_bar.dart';
import 'package:bookmark_codebase/components/user_inputs/text_form_fields/searching/search_book.dart';
import 'package:bookmark_codebase/utils/constants/size_constants.dart';
import 'package:bookmark_codebase/utils/enums/http_status_enums.dart';
import 'package:bookmark_codebase/utils/enums/reading_status_enums.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bookmark_codebase/business_logic/models/objects/book.dart';

class Page2 extends StatefulWidget {
  Page2({Key? key}) : super(key: key);

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    var rModel = context.read<SearchBookProvider>();
    if (rModel.boxes.isEmpty && rModel.bookList.isEmpty) {
      rModel.setInitStatus();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var wModel = context.watch<SearchBookProvider>();
    HttpStatusEnum stat = wModel.fetchingStatus;
    return RTLDirection(
      child: Scaffold(
        // backgroundColor: Colors.grey,
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 32),
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: Sizes.fromBottom + 48),
                SearchBookTextFormField(controller: _controller),
                const SizedBox(
                  height: 32,
                ),
                stat == HttpStatusEnum.idle
                    ? const SizedBox()
                    : stat == HttpStatusEnum.waiting
                        ? const CustomCircularProgressIndicatorWithText(readingStatus: ReadingStatus.goingToRead,)
                        : stat == HttpStatusEnum.notFound
                            ? const Text('کتابی پیدا نشد!')
                            : stat == HttpStatusEnum.error
                                ? const Text(
                                    'به دلیل نامشخصی نتونستیم کتابارو برات بیاریم.')
                                : stat == HttpStatusEnum.found
                                    ? SearchResultWidget(
                                        boxes: wModel.getWithoutBookListBoxValue
                                                .isEmpty
                                            ? wModel.boxes
                                            : wModel.getWithoutBookListBoxValue,
                                        bookList: wModel.bookList,
                                      )
                                    : const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SearchResultWidget extends StatelessWidget {
  final List<dynamic> boxes;
  final List<searched.Book> bookList;

  const SearchResultWidget(
      {Key? key, required this.boxes, required this.bookList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool hasBookList = context.watch<SearchBookProvider>().hasBookList;
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            BoxWidget(boxes: boxes),
            BookListWidget(bookList: bookList),
          ],
        ),
      ),
    );
  }
}

class BookListWidget extends StatelessWidget {
  final List<searched.Book> bookList;

  const BookListWidget({Key? key, required this.bookList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print("bookList: $bookList");
    return Wrap(
      children: [
        ...bookList.map((book) {
          Book res = Book(
            name: book.title ?? 'بدون نام',
            author:book.authors!.isEmpty?'بدون نویسنده':
                "${book.authors![0].firstName!} ${book.authors![0].lastName!}",
            rate: book.rating!.toDouble(),
            image: book.coverUri!,
            id: book.id!.toString(),
            preview: 'بدووون',
            comments: [],
          );
          return EachSearchedBook(book: res);
        }).toList()
      ],
    );
  }
}

class BoxWidget extends StatelessWidget {
  final List<dynamic> boxes;

  const BoxWidget({Key? key, required this.boxes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print("boxes: $boxes");

    return Wrap(
      children: [
        ...boxes.map(
          (e) {
            return Container(
              margin: const EdgeInsets.only(bottom: 32),
              // height: 300,
              width: double.infinity,
              child: Column(
                children: [
                  Text(
                    e.title ?? 'بدون تایتل',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Wrap(
                    children: [
                      ...e.bookData!.books!.map(
                        (book) {
                          Book res = Book(
                            name: book.title ?? 'بدون نام',
                            author: book.authors!.isEmpty?'بدون نویسنده':
                                "${book.authors![0].firstName!} ${book.authors![0].lastName!}",
                            rate: book.rating!.toDouble(),
                            image: book.coverUri!,
                            id: book.id!.toString(),
                            preview: 'بدون',
                            comments: [],
                          );
                          return EachSearchedBook(book: res);
                        },
                      ).toList()
                    ],
                  ),
                ],
              ),
            );
          },
        ).toList()
      ],
    );
  }
}
