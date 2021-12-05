import 'package:bookmark_codebase/business_logic/models/objects/book.dart';
import 'package:bookmark_codebase/business_logic/services/providers/bookshelf/handle_bookshelves.dart';
import 'package:bookmark_codebase/components/buttons/button.dart';
import 'package:bookmark_codebase/utils/enums/reading_status_enums.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookPreviewFloatingActionButton extends StatelessWidget {
  final Book book;

  const BookPreviewFloatingActionButton({Key? key, required this.book})
      : super(key: key);



  @override
  Widget build(BuildContext context) {
    var wModel = context.watch<HandlingBookshelvesProvider>();
    bool isBookInGoingToRead = isBookInGoingToReadChecker(book.id);

    var size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4),
      color: Colors.white,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            flex: 1,
            child: Button(
              width: double.infinity,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'میخوام بعدا بخونم',
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .apply(color: Colors.white),
                  ),
                  const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ],
              ),
              tappedColor: Colors.black.withOpacity(0.3),
              onTap: () {
                wModel.addBook(ReadingStatus.goingToRead, book);
              },
              defaultColor: Colors.black,
            ),
          ),
          Flexible(
            flex: 1,
            child: Button(
              width: size.width * 0.3,
              title: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  'قبلا خوندم',
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .apply(color: Colors.black),
                ),
              ),
              onTap: () {},
              defaultColor: Colors.white,
              tappedColor: Colors.black.withOpacity(0.1),
            ),
          ),
        ],
      ),
    );
  }

  bool isBookInGoingToReadChecker(String id, List<>) {
    for(int i=0;i<)
  }
}
