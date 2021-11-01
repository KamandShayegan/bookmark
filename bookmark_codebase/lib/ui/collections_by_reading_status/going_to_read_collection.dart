import 'package:bookmark_codebase/business_logic/models/objects/book.dart';
import 'package:bookmark_codebase/components/decorated_containers/going_to_read_container.dart';
import 'package:bookmark_codebase/components/directions/custom_directionality.dart';
import 'package:bookmark_codebase/utils/constants/color_constants.dart';
import 'package:bookmark_codebase/utils/enums/reading_status_enums.dart';
import 'package:bookmark_codebase/utils/methods/set_by_reading_status/set_string_by_reading_status.dart';
import 'package:flutter/material.dart';

class GoingToReadCollection extends StatelessWidget {
  final List<Book> books;
  const GoingToReadCollection({Key? key, required this.books})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return RTLDirection(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text(
            setStringByReadingStatus(ReadingStatus.goingToRead),
            style: textTheme.bodyText1!.apply(color: MyColors.blue),
          ),
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: MyColors.blue),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const SizedBox(
                  height: 24,
                ),
                ...books.map((e) {
                  return GoingToReadContainer(onTap: () {}, book: e);
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
