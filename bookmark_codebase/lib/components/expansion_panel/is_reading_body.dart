import 'package:bookmark_codebase/business_logic/models/objects/book.dart';
import 'package:bookmark_codebase/components/buttons/small_button.dart';
import 'package:bookmark_codebase/components/directions/custom_directionality.dart';
import 'package:bookmark_codebase/components/user_inputs/text_form_fields/updating_current_page/updating_current_page.dart';
import 'package:bookmark_codebase/utils/constants/color_constants.dart';
import 'package:bookmark_codebase/utils/methods/datetime/datetime_calculations.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class IsReadingExpansionBody extends StatefulWidget {
  final Book book;

  const IsReadingExpansionBody({Key? key, required this.book})
      : super(key: key);

  @override
  State<IsReadingExpansionBody> createState() => _IsReadingExpansionBodyState();
}

class _IsReadingExpansionBodyState extends State<IsReadingExpansionBody> {
  final TextEditingController _controller = TextEditingController();

  List<String> getAllPages(int lastPage) {
    List<String> allPages = [];
    for (int i = 1; i <= lastPage; i++) {
      allPages.add(i.toString());
    }
    return allPages;
  }

  @override
  Widget build(BuildContext context) {
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
            CircularPercentIndicator(
              circularStrokeCap: CircularStrokeCap.round,
              backgroundColor: Colors.white,
              radius: 130.0,
              lineWidth: 15.0,
              percent: 0.80,
              // center: new Text("100%"),
              progressColor: MyColors.bone,
              startAngle: 270,
              // linearGradient: LinearGradient(
              //   colors: [
              //     MyColors.bone,
              //     MyColors.bone.withOpacity(0.5),
              //   ],
              // ),
              animation: true,
              animationDuration: 1000,
              animateFromLastPercent: true,
              curve: Curves.linear,

              // arcBackgroundColor: Colors.red,
              // arcType: ArcType.FULL,
            ),
            SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'تا صفحه',
                  style: Theme.of(context).textTheme.headline5,
                ),
                SizedBox(
                  width: 8,
                ),
                SizedBox(
                    // height: size.height * 0.1,
                    width: size.width * 0.25,
                    // decoration: BoxDecoration(
                    //   color: MyColors.bone.withOpacity(0.2),
                    //   borderRadius: BorderRadius.circular(8),
                    // ),
                    child: UpdatingCurrentpageTextFormField(
                      currentPageAsHint: widget.book.currentPage,
                      controller: _controller,
                      lastPage: lastPage,
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
                SizedBox(
                  width: 8,
                ),
                Text(
                  'خوندم.',
                  style: Theme.of(context).textTheme.headline5,
                )
              ],
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Button(
                title: Text(
                  'بروز رسانی',
                  style: Theme.of(context).textTheme.headline6!.apply(
                      color: Colors.white.withOpacity(0.7),
                      fontWeightDelta: 2),
                ),
                onTap: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
