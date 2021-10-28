import 'package:bookmark_codebase/business_logic/models/objects/book.dart';
import 'package:bookmark_codebase/utils/enums/reading_status_enums.dart';
import 'package:flutter/material.dart';

class HandlingBookshelvesProvider extends ChangeNotifier {
  List<Book> _isReading = [
    Book(
        name: 'سه شنبه ها با موری',
        image: 'https://img.ketabrah.ir/img/l/5193640895976714.jpg'),
    Book(pageCount: 40, name: 'سه شنبه ها با موری', image: ''),
    Book(
        name: 'سه شنبه ها با موری',
        image: 'https://img.ketabrah.ir/img/l/5193640895976714.jpg'),
    Book(
        name: 'سه شنبه ها با موری',
        image: 'https://img.ketabrah.ir/img/l/5193640895976714.jpg'),
    Book(
        name: 'سه شنبه ها با موری',
        image: 'https://img.ketabrah.ir/img/l/5193640895976714.jpg'),
    Book(
        name: 'سه شنبه ها با موری',
        image: 'https://img.ketabrah.ir/img/l/5193640895976714.jpg'),
    Book(
        name: 'سه شنبه ها با موری',
        image: 'https://img.ketabrah.ir/img/l/5193640895976714.jpg'),
  ];

  List<Book> _goingToRead = [
    Book(),
    Book(),
  ];

  List<Book> _readBefore = [
    Book(),
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
    //based on reading status, first we remove the book locally and then let the database know that the book is removed. (or reversed order)
    notifyListeners();
  }
}
