import 'package:bookmark_codebase/business_logic/models/json_2_dart/search_result.dart';
import 'package:bookmark_codebase/business_logic/services/providers/search_book/search_book_provider.dart';
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
    List<Box> boxes = [];
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
                Container(
                  child: Center(
                    child: stat == HttpStatusEnum.waiting
                        ? CustomCircularProgressIndicatorWithText()
                        : stat == HttpStatusEnum.error
                            ? const Text('نشد')
                            : SearchResultWidget(boxes: boxes),
                  ),
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

  const SearchResultWidget({Key? key, required this.boxes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...boxes
            .map(
              (e) => Column(
                children: [
                  Text(
                    e.title ?? 'بدون تایتل',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  ...e.bookData!.books!
                      .map(
                        (book) => Column(
                          children: [
                            Text(book.title ?? 'بدون'),
                            Text(book.subtitle ?? 'بدوننن'),
                            ReadOnlyRatingBar(rating: book.rating ?? 0),
                          ],
                        ),
                      )
                      .toList()
                ],
              ),
            )
            .toList()
      ],
    );
  }
}
