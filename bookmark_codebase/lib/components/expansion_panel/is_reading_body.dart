import

'package:bookmark_codebase/business_logic/models/objects/book.dart';
import 'package:bookmark_codebase/business_logic/services/providers/bookshelf/handle_bookshelves.dart';
import 'package:bookmark_codebase/components/buttons/button.dart';
import 'package:bookmark_codebase/components/directions/custom_directionality.dart';
import 'package:bookmark_codebase/components/progress_indicators/circular_percent_indicator.dart';
import 'package:bookmark_codebase/components/user_inputs/text_form_fields/updating_current_page/updating_current_page.dart';
import 'package:bookmark_codebase/utils/constants/color_constants.dart';
import 'package:bookmark_codebase/utils/methods/actions_on_page_counts/actions_on_page_counts.dart';
import 'package:bookmark_codebase/utils/methods/datetime/datetime_calculations.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class IsReadingExpansionBody extends StatefulWidget {
  final Book book;

  const IsReadingExpansionBody({Key? key, required this.book})
      : super(key: key);

  @override
  State<IsReadingExpansionBody> createState() => _IsReadingExpansionBodyState();
}

class _IsReadingExpansionBodyState extends State<IsReadingExpansionBody> {
  final TextEditingController _controller = TextEditingController();
  final _key = GlobalKey<FormState>();
  bool validated = false;

  List<String> getAllPages(int lastPage) {
    List<String> allPages = [];
    for (int i = 1; i <= lastPage; i++) {
      allPages.add(i.toString());
    }
    return allPages;
  }

  @override
  Widget build(BuildContext context) {
    double progress = ActionsOnPageCounts().calculateBookProgressFrom1(
        widget.book.currentPage, widget.book.pageCount);
    int lastPage = widget.book.pageCount;
    var size = MediaQuery.of(context).size;
    String dateTime = DateTimeCalculations()
        .DateTimeToJalaliWithFormattedResult(
            widget.book.startDate ?? DateTime.now());
    return Center(
      child: RTLDirection(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                ' شروع: ${dateTime}   ',
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .apply(color: Colors.black38.withOpacity(0.3)),
              ),
            ),
            CustomCircularPercentIndicator(progress: progress),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'تا صفحه',
                  style: Theme.of(context).textTheme.headline5,
                ),
                const SizedBox(
                  width: 8,
                ),
                SizedBox(
                    // height: size.height * 0.1,
                    width: size.width * 0.25,
                    // decoration: BoxDecoration(
                    //   color: MyColors.bone.withOpacity(0.2),
                    //   borderRadius: BorderRadius.circular(8),
                    // ),
                    child: Form(
                      key: _key,
                      onChanged: () {
                        validated = _key.currentState!.validate();
                        if (_controller.text == '' ||
                            int.parse(_controller.text) ==
                                widget.book.currentPage) {
                          validated = false;
                        }
                        setState(() {});
                      },
                      child: UpdatingCurrentPageTextFormField(
                        currentPageAsHint: widget.book.currentPage,
                        controller: _controller,
                        lastPage: lastPage,
                        book: widget.book,
                      ),
                    )

                    // WheelChooser.integer(
                    //   unSelectTextStyle: Theme.of(context)
                    //       .textTheme
                    //       .headline6!
                    //       .apply(color: Colors.black38),
                    //   selectTextStyle: Theme.of(context)
                    //       .textTheme
                    //       .headline6!
                    //       .apply(
                    //           color: Colors.black.withOpacity(0.7),
                    //           fontWeightDelta: 2),
                    //   onValueChanged: (i) => print(i),
                    //   maxValue: book.pageCount,
                    //   minValue: 1,
                    //   step: 2,
                    // ),
                    ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  'خوندم.',
                  style: Theme.of(context).textTheme.headline5,
                )
              ],
            ),
            // Align(
            //   alignment: Alignment.bottomLeft,
            //   child: Button(
            //     width: 90,
            //     tappedColor: MyColors.boneDarker,
            //     isOn: validated,
            //     title: Text(
            //       'بروز رسانی',
            //       style: Theme.of(context).textTheme.headline6!.apply(
            //           color: validated
            //               ? Colors.white.withOpacity(0.7)
            //               : MyColors.bone.withOpacity(0.6),
            //           fontWeightDelta: 2),
            //     ),
            //     onTap: () {
            //       // var rModel = context.read<HandlingBookshelvesProvider>();
            //       // rModel.setNewCurrentPage(widget.book);
            //     },
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
