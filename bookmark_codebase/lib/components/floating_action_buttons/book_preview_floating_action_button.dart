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
    bool isBookInGoingToRead =
        ActionsOnLists().isBookInTheList(book, wModel.goingToRead)!;
    bool hasBookBeenReadBefore = ActionsOnLists().isBookInTheList(book, wModel.readBefore)!;
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
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    isBookInGoingToRead
                        ? 'قراره بعدا بخونی'
                        : 'میخوام بعدا بخونم',
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .apply(color: Colors.white),
                  ),
                  Icon(
                    isBookInGoingToRead
                        ? Icons.check
                        : Icons.add,
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
              isOn: !hasBookBeenReadBefore,
              width: size.width * 0.3,
              title: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  hasBookBeenReadBefore?'قبلا خوندیش':
                  'قبلا خوندم',
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .apply(color: hasBookBeenReadBefore?Colors.grey:Colors.black),
                ),
              ),
              onTap: () {
                wModel.addBook(ReadingStatus.readBefore, book);
              },
              defaultColor: Colors.white,
              tappedColor: Colors.black.withOpacity(0.1),
            ),
          ),
        ],
      ),
    );
  }
}
