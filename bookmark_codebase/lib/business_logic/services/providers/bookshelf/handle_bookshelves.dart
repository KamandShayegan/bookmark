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
      pageCount: 200,
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
      pageCount: 100,
        id: 'ffdfdfdfdfdfdfdllalallllalalal33333a',
        name: 'سه شنبه ها با موری',
        image:
            'https://www.shahrezaban.com/media/uploads/catalog/default/product_2391_1561121169_93380.jpg'),
    Book(
      pageCount: 200,
        id: 'ffdfdf21212dfdfdfdfdllalallllalalala',
        name: 'سه شنبه ها با موری',
        image:
            'https://www.shahrezaban.com/media/uploads/catalog/default/product_2391_1561121169_93380.jpg'),
    Book(
      pageCount: 300,
        id: '1234',
        name: 'سه شنبه ها با موری',
        image:
            'https://www.shahrezaban.com/media/uploads/catalog/default/product_2391_1561121169_93380.jpg'),
    Book(
      pageCount: 200,
        id: '345',
        name: 'سه شنبه ها با موری',
        image:
            'https://www.shahrezaban.com/media/uploads/catalog/default/product_2391_1561121169_93380.jpg'),
    Book(
      pageCount: 400,
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

  Future removeBook(ReadingStatus readingStatus, Book book) async {
    if (readingStatus == ReadingStatus.isReading) {
      for(int i=0;i<_isReading.length;i++){
        if(book.id==_isReading[i].id){
          _isReading.removeAt(i);
          notifyListeners();
        }
      }
    } else if (readingStatus == ReadingStatus.goingToRead) {
      for(int i=0;i<_goingToRead.length;i++){
        if(book.id==_goingToRead[i].id){
          _goingToRead.removeAt(i);
          notifyListeners();
        }
      }
    } else if (readingStatus == ReadingStatus.readBefore) {
      for(int i=0;i<_readBefore.length;i++){
        if(book.id==_readBefore[i].id){
          _readBefore.removeAt(i);
          notifyListeners();
        }
      }
    }
  }

  Future startReading(Book book) async {
    _goingToRead.removeWhere((e) => e.id == book.id);
    book.startDate = DateTime.now();
    _isReading.add(book);
    notifyListeners();
  }

  int localCurPage = 0;

  setNewCurrentPage(Book book,){
    for(int i=0;i<_isReading.length;i++){
      if(_isReading[i].id == book.id){
        _isReading[i].currentPage=localCurPage;
        notifyListeners();
      }
    }

  }

  setFinishedDate(Book book){
    book.finishDate = DateTime.now();
    //first we set date and then we add it to _readBefore list.
    notifyListeners();
  }
}
