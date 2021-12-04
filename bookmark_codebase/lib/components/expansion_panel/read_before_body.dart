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
    return Container();
  }

}
