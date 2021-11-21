import 'package:bookmark_codebase/business_logic/models/json_2_dart/search_result.dart';
import 'package:bookmark_codebase/business_logic/services/http_services/requests.dart';
import 'package:bookmark_codebase/utils/enums/http_status_enums.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class SearchBookProvider extends ChangeNotifier {
  bool _hasBookList = false;

  bool get hasBookList => _hasBookList;

  setHasBookLists(bool value) {
    _hasBookList = value;
    notifyListeners();
  }

  List<Box> _boxes = [];

  List<Box> get boxes => _boxes;

  setBoxValue(List<Box> boxes) {
    _boxes.addAll(boxes);
    notifyListeners();
  }

  List<Book> _bookList = [];

  List<Book> get bookList => _bookList;

  setBookListValue(List<Book> books) {
    _bookList.addAll(books);
    notifyListeners();
  }

  HttpStatusEnum _fetchingStatus = HttpStatusEnum.idle;

  HttpStatusEnum get fetchingStatus => _fetchingStatus;

  setFetchingStatus(HttpStatusEnum stat) {
    _fetchingStatus = stat;
    notifyListeners();
  }

  setInitStatus(){
    _fetchingStatus = HttpStatusEnum.idle;
  }

  Future searchBook(String word) async {
    List<Book> resultList = [];
    word = word.replaceAll(' ', '+');
    print('searched book:  $word');
    try {
      setFetchingStatus(HttpStatusEnum.waiting);
      Response response =
      await HttpRequests().getRequest("search.json?term=$word");
      // print("response: \n\n ${response.data} \n\n");
      SearchResult searchResult = SearchResult.fromJson(response.data);
      if (searchResult.pageProps!.pageConfig!.bookList!.books.isNotEmpty &&
          searchResult.pageProps!.pageConfig!.boxes.isNotEmpty) {
        print('both exist');
        print("bookliiiiist: ${searchResult.pageProps!.pageConfig!.bookList!.books}");
        setHasBookLists(true);
        setBookListValue(searchResult.pageProps!.pageConfig!.bookList!.books);
        setBoxValue(searchResult.pageProps!.pageConfig!.boxes);
        setFetchingStatus(HttpStatusEnum.found);
      } else
      if (searchResult.pageProps!.pageConfig!.bookList!.books.isNotEmpty &&
          searchResult.pageProps!.pageConfig!.boxes.isEmpty) {
        print('only book list');
        setHasBookLists(true);
        setBookListValue(searchResult.pageProps!.pageConfig!.bookList!.books);
        setFetchingStatus(HttpStatusEnum.found);
      }
      else if (searchResult.pageProps!.pageConfig!.bookList!.books.isEmpty &&
          searchResult.pageProps!.pageConfig!.boxes.isNotEmpty){
        print('only box');
        setHasBookLists(false);
        setBoxValue(searchResult.pageProps!.pageConfig!.boxes);
        setFetchingStatus(HttpStatusEnum.found);
      }
      else if (_bookList.isEmpty && _boxes.isEmpty) {
        setFetchingStatus(HttpStatusEnum.notFound);
      }
    } on DioError {
      setFetchingStatus(HttpStatusEnum.error);
      rethrow;
    }
  }
}
