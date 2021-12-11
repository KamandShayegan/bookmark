import 'package:bookmark_codebase/business_logic/models/objects/book.dart';
import 'package:bookmark_codebase/components/buttons/button.dart';
import 'package:bookmark_codebase/components/directions/custom_directionality.dart';
import 'package:bookmark_codebase/components/user_inputs/text_form_fields/updating_current_page/updating_current_page.dart';
import 'package:bookmark_codebase/utils/constants/color_constants.dart';
import 'package:bookmark_codebase/utils/methods/datetime/datetime_calculations.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:wheel_chooser/wheel_chooser.dart';

class ReadBeforeExpansionBody extends StatefulWidget {
  final Book book;

  const ReadBeforeExpansionBody({Key? key, required this.book})
      : super(key: key);

  @override
  State<ReadBeforeExpansionBody> createState() =>
      _ReadBeforeExpansionBodyState();
}

class _ReadBeforeExpansionBodyState extends State<ReadBeforeExpansionBody> {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme.headline5;
    bool isEmpty = false;
    String startDate = '';
    String finishDate = '';
    try {
      startDate = DateTimeCalculations()
          .dateTimeToJalaliWithFormattedResult(widget.book.startDate!);
      finishDate = DateTimeCalculations()
          .dateTimeToJalaliWithFormattedResult(widget.book.finishDate!);
    } catch (e) {
      startDate = '-';
      finishDate = '-';
      isEmpty = true;
    }

    if (startDate.isEmpty || finishDate.isEmpty) {
      print('true');
    }

    return Container(
      margin: const EdgeInsets.all(8),
      child: isEmpty
          ? Center(
              child: Text(
                'اطلاعاتی در دسترس نیست.',
                style: textTheme,
              ),
            )
          : Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                        width: 40, child: Text('شروع:', style: textTheme)),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(startDate, style: textTheme),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                        width: 40, child: Text('پایان:', style: textTheme)),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(finishDate, style: textTheme),
                  ],
                )
              ],
            ),
    );
  }
}


