import 'package:bookmark_codebase/business_logic/models/objects/book.dart';
import 'package:bookmark_codebase/utils/enums/reading_status_enums.dart';
import 'package:flutter/material.dart';

class HandlingBookshelvesProvider extends ChangeNotifier {
  List<Book> _isReading = [
    Book(
        name: 'سه شنبه ها با موری',
        image:
            'https://www.shahrezaban.com/media/uploads/catalog/default/product_2391_1561121169_93380.jpg'),
    Book(pageCount: 40, name: 'سه شنبه ها با موری', image: ''),
    Book(
        name: 'سه شنبه ها با موری',
        image:
            'https://www.shahrezaban.com/media/uploads/catalog/default/product_2391_1561121169_93380.jpg'),
    Book(
        name: 'سه شنبه ها با موری',
        image:
            'https://www.shahrezaban.com/media/uploads/catalog/default/product_2391_1561121169_93380.jpg'),
    Book(
        name: 'سه شنبه ها با موری',
        image:
            'https://www.shahrezaban.com/media/uploads/catalog/default/product_2391_1561121169_93380.jpg'),
    Book(
        name: 'سه شنبه ها با موری',
        image:
            'https://www.shahrezaban.com/media/uploads/catalog/default/product_2391_1561121169_93380.jpg'),
    Book(
        name: 'سه شنبه ها با موری',
        image:
            'https://www.shahrezaban.com/media/uploads/catalog/default/product_2391_1561121169_93380.jpg'),
  ];

  List<Book> _goingToRead = [
    Book(id: '04930493049304903'),
    Book(id: '42098429380403898038028093849284'),
    Book(
        id: '3497285729fnskjhfjdfj',
        name: 'سه شنبه ها با موری',
        image:
            'https://www.shahrezaban.com/media/uploads/catalog/default/product_2391_1561121169_93380.jpg'),
    Book(
        id: 'hskjdbfjbuy8',
        name: 'سه شنبه ها با موری',
        image:
            'https://www.shahrezaban.com/media/uploads/catalog/default/product_2391_1561121169_93380.jpg'),
    Book(
        id: '3497285729fnskjhffffjdfj',
        name: 'سه شنبه ها با موری',
        image:
            'https://www.shahrezaban.com/media/uploads/catalog/default/product_2391_1561121169_93380.jpg'),
    Book(
        id: '3497285729fnskj2222hfjdfj',
        name: 'سه شنبه ها با موری',
        image:
            'https://www.shahrezaban.com/media/uploads/catalog/default/product_2391_1561121169_93380.jpg'),
  ];

  List<Book> _readBefore = [
    Book(),
    Book(
        name: 'سه شنبه ها با موری',
        image:
            'https://www.shahrezaban.com/media/uploads/catalog/default/product_2391_1561121169_93380.jpg'),
  ];

  List<Book> get isReading => _isReading;
  List<Book> get readBefore => _readBefore;
  List<Book> get goingToRead => _goingToRead;

  Future loadAllBooks() async {
    _readBefore = await _fetchReadBeforeBooks();
    _goingToRead = await _fetchGoingToReadBooks();
    _isReading = await _fetchIsReadingBooks();

    notifyListeners();
  }

  Future _fetchReadBeforeBooks() async {}

  Future _fetchGoingToReadBooks() async {}

  Future _fetchIsReadingBooks() async {}

  Future addBook(ReadingStatus readingStatus, String bookId) async {
    //here we fetch a book and .add it to the required list (based on reading status)
    notifyListeners();
  }

  Future removeBook(ReadingStatus readingStatus, String bookId) async {
    if (readingStatus == ReadingStatus.isReading) {
      _isReading.removeWhere((e) => e.id == bookId);
    } else if (readingStatus == ReadingStatus.goingToRead) {
      _goingToRead.removeWhere((e) => e.id == bookId);
    } else if (readingStatus == ReadingStatus.readBefore) {
      _readBefore.removeWhere((e) => e.id == bookId);
    }
    //based on reading status, first we remove the book locally and then let the database know that the book is removed. (or reversed order)
    notifyListeners();
  }
}
