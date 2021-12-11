import 'package:bookmark_codebase/business_logic/models/objects/book.dart';

class ActionsOnLists {
  void optionSelector(List<bool> options, int selectedIndex) {
    int leng = options.length;
    for (int i = 0; i < leng; i++) {
      if (i == selectedIndex) {
        options[i] = true;
      } else {
        options[i] = false;
      }
    }
  }

  bool? isBookInTheList(Book book, List<Book> shelf) {
    for (int i = 0; i < shelf.length; i++) {
      if (shelf[i].id == book.id) {
        return true;
      } else {
        return false;
      }
    }
  }
}