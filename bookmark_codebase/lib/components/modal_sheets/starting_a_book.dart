import 'package:bookmark_codebase/business_logic/models/objects/book.dart';
import 'package:bookmark_codebase/components/buttons/button.dart';
import 'package:bookmark_codebase/utils/enums/reading_status_enums.dart';
import 'package:provider/provider.dart';
import 'package:bookmark_codebase/business_logic/services/providers/bookshelf/handle_bookshelves.dart';
import 'package:bookmark_codebase/components/user_inputs/check_boxes/check_box.dart';
import 'package:bookmark_codebase/utils/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:wheel_chooser/wheel_chooser.dart';

class StartingABook extends StatefulWidget {
  final Book book;

  const StartingABook({Key? key, required this.book}) : super(key: key);

  @override
  State<StartingABook> createState() => _StartingABookState();
}

class _StartingABookState extends State<StartingABook> {
  List<bool> value = [false, false];

  // double sizeFraction = 0.2;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return AnimatedContainer(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 32),
      height: size.height * 0.45,
      duration: const Duration(seconds: 0),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              value = [true, false];
              setState(() {});
            },
            child: CustomCheckBox(
                isSelected: value[0], text: 'میخوام از اول بخونم.'),
          ),
          const SizedBox(
            height: 16,
          ),
          GestureDetector(
            onTap: () {
              value = [false, true];
              setState(() {});
            },
            child: CustomCheckBox(
                isSelected: value[1], text: 'میخوام از صفحه خاصی شروع کنم.'),
          ),
          SizedBox(
            height: 32,
          ),
          StartingFromASpecificPage(book: widget.book, isNotFaded: value[1]),
        ],
      ),
    );
  }
}

class StartingFromASpecificPage extends StatefulWidget {
  final Book book;
  final bool isNotFaded;

  const StartingFromASpecificPage(
      {Key? key, required this.book, required this.isNotFaded})
      : super(key: key);

  @override
  State<StartingFromASpecificPage> createState() =>
      _StartingFromASpecificPageState();
}

class _StartingFromASpecificPageState extends State<StartingFromASpecificPage> {
  int curPage = 1;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(seconds: 1),
            decoration: BoxDecoration(
              color: widget.isNotFaded
                  ? MyColors.blue
                  : MyColors.blue.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            height: 120,
            width: 60,
            child: widget.isNotFaded
                ? WheelChooser.integer(
                    unSelectTextStyle: Theme.of(context)
                        .textTheme
                        .headline6!
                        .apply(color: Colors.black38),
                    selectTextStyle: Theme.of(context)
                        .textTheme
                        .headline6!
                        .apply(
                            color: Colors.black.withOpacity(0.7),
                            fontWeightDelta: 2),
                    onValueChanged: (i) {
                      curPage = i;
                      setState(() {});
                    },
                    maxValue: widget.book.pageCount,
                    minValue: 1,
                    step: 1,
                  )
                : Center(
                    child: Text(
                    '-',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .apply(color: MyColors.blue),
                  )),
          ),
          const SizedBox(
            height: 8,
          ),
          Button(
            title: Text(
              'شروع',
              style: Theme.of(context)
                  .textTheme
                  .button!
                  .apply(color: Colors.white),
            ),
            onTap: () {
              var readModel = context.read<HandlingBookshelvesProvider>();
              widget.book.currentPage = curPage;
              widget.book.startDate = DateTime.now();
              readModel.addBook(ReadingStatus.isReading, widget.book);
              Navigator.pop(context);
              Navigator.pop(context);
            },
            width: 70,
            tappedColor: MyColors.lightBlue,
            isPrimary: false,
            isOn: widget.isNotFaded ? (curPage == 1 ? false : true) : true,
            defaultColor: MyColors.blueDarker,
          ),
        ],
      ),
    );
  }
}
