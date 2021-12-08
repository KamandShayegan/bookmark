import 'package:bookmark_codebase/business_logic/models/objects/book.dart';
import 'package:bookmark_codebase/utils/enums/reading_status_enums.dart';
import 'package:flutter/material.dart';

class HandlingBookshelvesProvider extends ChangeNotifier {

  int _locallyChangedCurrentPage=0;
  int get locallyChangedCurrentPage => _locallyChangedCurrentPage;
  setLocallyChangedCurrentPage(int curPage){
    _locallyChangedCurrentPage = curPage;
    // notifyListeners();
  }


  List<Book> _isReading = [
    Book(
        id: 'faadss',
        name: 'سه شنبه ها با موری',
        image:
            'https://www.shahrezaban.com/media/uploads/catalog/default/product_2391_1561121169_93380.jpg'),
    Book(
        pageCount: 40,
        name: 'سه شنبه ها با موری',
        image: '',
        id: 'ffdfdfdfdfdfdfdllalallllalalala'),
    Book(
        id: 'ffdfdfdfdfdfdfdllalallllalalal33333a',
        name: 'سه شنبه ها با موری',
        image:
            'https://www.shahrezaban.com/media/uploads/catalog/default/product_2391_1561121169_93380.jpg'),
    Book(
        id: 'ffdfdf21212dfdfdfdfdllalallllalalala',
        name: 'سه شنبه ها با موری',
        image:
            'https://www.shahrezaban.com/media/uploads/catalog/default/product_2391_1561121169_93380.jpg'),
    Book(
        id: '1234',
        name: 'سه شنبه ها با موری',
        image:
            'https://www.shahrezaban.com/media/uploads/catalog/default/product_2391_1561121169_93380.jpg'),
    Book(
        id: '345',
        name: 'سه شنبه ها با موری',
        image:
            'https://www.shahrezaban.com/media/uploads/catalog/default/product_2391_1561121169_93380.jpg'),
    Book(
        id: '20192',
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
    Book(
        id: '34972222222285729fnskj2222hfjdfj',
        name: 'سه شنبه ها با موری',
        image:
            'https://www.shahrezaban.com/media/uploads/catalog/default/product_2391_1561121169_93380.jpg'),
    Book(
        id: '3497285729fnskj2222hmfmfmfmmfffjdfj',
        name: 'سه شنبه ها با موری',
        image:
            'https://www.shahrezaban.com/media/uploads/catalog/default/product_2391_1561121169_93380.jpg'),
    Book(
        id: '3497285729fnskj2222hfjdlalalalallalalallallllllllllfj',
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

  Future addBook(ReadingStatus readingStatus, Book book) async {
    switch (readingStatus) {
      case ReadingStatus.readBefore:
        _readBefore.add(book);
        notifyListeners();
        break;
      case ReadingStatus.goingToRead:
        _goingToRead.add(book);
        notifyListeners();
        break;
      case ReadingStatus.isReading:
        _isReading.add(book);
        notifyListeners();
        break;
    }
  }

  Future removeBook(ReadingStatus readingStatus, int i) async {
    if (readingStatus == ReadingStatus.isReading) {
      _isReading.removeAt(i);
    } else if (readingStatus == ReadingStatus.goingToRead) {
      _goingToRead.removeAt(i);
    } else if (readingStatus == ReadingStatus.readBefore) {
      _readBefore.removeAt(i);
    }
    //based on reading status, first we remove the book locally and then let the database know that the book is removed. (or reversed order)
    notifyListeners();
  }

  Future startReading(Book book) async {
    _goingToRead.removeWhere((e) => e.id == book.id);
    _isReading.add(book);
    notifyListeners();
  }

  setNewCurrentPage(Book book, int newCurPage){
    for(int i=0;i<_isReading.length;i++){
      if(_isReading[i].id == book.id){
        _isReading[i].currentPage=newCurPage;
        notifyListeners();
      }
    }

  }
}
