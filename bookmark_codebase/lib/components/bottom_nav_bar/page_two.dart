import 'package:bookmark_codebase/business_logic/models/json_2_dart/search_result.dart';
import 'package:bookmark_codebase/business_logic/services/providers/search_book/search_book_provider.dart';
import 'package:bookmark_codebase/components/book_containers/book_cover.dart';
import 'package:bookmark_codebase/components/directions/custom_directionality.dart';
import 'package:bookmark_codebase/components/progress_indicators/circular/custom_circular_progress_indicator.dart';
import 'package:bookmark_codebase/components/rating/read_only_rating_bar.dart';
import 'package:bookmark_codebase/components/user_inputs/text_form_fields/searching/search_book.dart';
import 'package:bookmark_codebase/utils/constants/size_constants.dart';
import 'package:bookmark_codebase/utils/enums/http_status_enums.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Page2 extends StatelessWidget {
  Page2({Key? key}) : super(key: key);

  final TextEditingController _controller = TextEditingController();

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
                stat == HttpStatusEnum.waiting
                    ? const CustomCircularProgressIndicatorWithText()
                    : stat == HttpStatusEnum.notFound
                        ? const Text('کتابی پیدا نشد!')
                        : stat == HttpStatusEnum.error
                            ? const Text(
                                'به دلیل نامشخصی نتونستیم کتابارو برات بیاریم.')
                            : SearchResultWidget(
                                boxes: wModel.boxes,
                                bookList: wModel.bookList,
                              ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SearchResultWidget extends StatelessWidget {
  final List<Box> boxes;
  final List<Book> bookList;

  const SearchResultWidget(
      {Key? key, required this.boxes, required this.bookList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool hasBookList = context.watch<SearchBookProvider>().hasBookList;
    print('search found');
    print(boxes);
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
            children: hasBookList
                ? bookList.map((book) {
                    return Column(
                      children: [
                        Text(book.title ?? 'بدون تایتل'),
                        Text(book.subtitle ?? 'بدون سابتایتل'),
                        ReadOnlyRatingBar(
                          rating: (book.rating ?? 0).toDouble(),
                        ),
                      ],
                    );
                  }).toList()
                : boxes
                    .map(
                      (e) => Container(
                        margin: EdgeInsets.only(bottom: 16),
                        // height: 300,
                        width: double.infinity,
                        child: Column(
                          children: [
                            Text(
                              e.title ?? 'بدون تایتل',
                              style: Theme.of(context).textTheme.headline1,
                            ),
                            ...e.bookData!.books!
                                .map(
                                  (book) => Container(
                                    margin: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        border: Border.all(color: Colors.grey)),
                                    child: Row(
                                      children: [
                                        BookCover(
                                            image: book.coverUri ?? '',
                                            name: book.title ?? 'بدون title'),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Column(
                                          children: [
                                            Text(book.title ?? 'بدون title'),
                                            Text(book.subtitle ??
                                                'بدون subtitle '),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                                .toList()
                          ],
                        ),
                      ),
                    )
                    .toList()),
      ),
    );
  }
}
