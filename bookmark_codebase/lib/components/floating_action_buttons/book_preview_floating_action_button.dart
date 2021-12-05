import 'package:bookmark_codebase/business_logic/models/objects/book.dart';
import 'package:bookmark_codebase/business_logic/services/providers/bookshelf/handle_bookshelves.dart';
import 'package:bookmark_codebase/components/buttons/button.dart';
import 'package:bookmark_codebase/utils/enums/reading_status_enums.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bookmark_codebase/utils/methods/actions_on_lists/actions_on_lists.dart';

class BookPreviewFloatingActionButton extends StatelessWidget {
  final Book book;

  const BookPreviewFloatingActionButton({Key? key, required this.book})
      : super(key: key);



  @override
  Widget build(BuildContext context) {
    var wModel = context.watch<HandlingBookshelvesProvider>();
    bool isBookInGoingToRead = ActionsOnLists().isBookInTheList(book, wModel.goingToRead);

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
              isOn: !isBookInGoingToRead,
              width: double.infinity,
              title:
              isBookInGoingToRead?Text( 'تصمیم گرفتی بعدا بخونی',
                style: Theme.of(context)
                    .textTheme
                    .caption!
                    .apply(color: Colors.white),):
              Row(
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
}
