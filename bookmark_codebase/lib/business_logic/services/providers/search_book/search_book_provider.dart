import 'package:bookmark_codebase/business_logic/models/json_2_dart/search_result.dart';
import 'package:bookmark_codebase/business_logic/services/http_services/requests.dart';
import 'package:bookmark_codebase/utils/enums/http_status_enums.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class SearchBookProvider extends ChangeNotifier {

  bool _hasBookList = false;

  bool get hasBookList => _hasBookList;

  setHasBookLists(bool value){
    _hasBookList = value;
    notifyListeners();
  }

  List<Box> _boxes = [];

  List<Box> get boxes => _boxes;

  setBoxValue(List<Box> boxes) {
    _boxes = boxes;
    notifyListeners();
  }

  List<Book> _bookList = [];

  List<Book> get bookList => _bookList;

  setBookListValue(List<Book> books) {
    _bookList = bookList;
    notifyListeners();
  }

  HttpStatusEnum _fetchingStatus = HttpStatusEnum.idle;

  HttpStatusEnum get fetchingStatus => _fetchingStatus;

  setFetchingStatus(HttpStatusEnum stat) {
    _fetchingStatus = stat;
    notifyListeners();
  }

  Future searchBook(String word) async {
    word = word.replaceAll(' ', '+');
    print('search book:  $word');
    try {
      setFetchingStatus(HttpStatusEnum.waiting);
      Response response =
          await HttpRequests().getRequest("search.json?term=$word");
      print(response.data);
      SearchResult searchResult = SearchResult.fromJson(response.data);
      if (searchResult.pageProps!.pageConfig!.boxes.isNotEmpty) {
        setHasBookLists(false);
        setBoxValue(searchResult.pageProps!.pageConfig!.boxes);
        setFetchingStatus(HttpStatusEnum.found);
        return response;
      } else if(searchResult.pageProps!.pageConfig!.bookList==null) {
        setHasBookLists(true);
        setBookListValue(searchResult.pageProps!.pageConfig!.bookList!.books);
        setFetchingStatus(HttpStatusEnum.found);
        return response;
      }else{
        setFetchingStatus(HttpStatusEnum.notFound);
    }
    } on DioError {
      setFetchingStatus(HttpStatusEnum.error);
      rethrow;
    }
  }
}
