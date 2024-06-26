import 'package:bookmark_codebase/business_logic/models/json_2_dart/search_result.dart'
    as wBookList;
import 'package:bookmark_codebase/business_logic/models/json_2_dart/search_result_without_booklist.dart'
    as woBookList;
import 'package:bookmark_codebase/business_logic/models/json_2_dart/search_result_without_booklist.dart';
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

  List<wBookList.Box> _boxes = [];

  List<wBookList.Box> get boxes => _boxes;

  setBoxValue(List<wBookList.Box> boxes) {
    _boxes.clear();
    _boxes.addAll(boxes);
    notifyListeners();
  }

  List<woBookList.Box> _woboxes = [];

  List<woBookList.Box> get getWithoutBookListBoxValue => _woboxes;

  setWithoutBookListBoxValue(List<woBookList.Box> boxes) {
    _woboxes.clear();
    _woboxes.addAll(boxes);
    notifyListeners();
  }

  List<wBookList.Book> _bookList = [];

  List<wBookList.Book> get bookList => _bookList;

  setBookListValue(List<wBookList.Book> books) {
    _bookList.clear();
    _bookList.addAll(books);
    notifyListeners();
  }

  HttpStatusEnum _fetchingStatus = HttpStatusEnum.idle;

  HttpStatusEnum get fetchingStatus => _fetchingStatus;

  setFetchingStatus(HttpStatusEnum stat) {
    _fetchingStatus = stat;
    notifyListeners();
  }

  setInitStatus() {
    _fetchingStatus = HttpStatusEnum.idle;
  }

  Future searchBook(String word) async {
    // setBoxValue([]);
    // setBookListValue([]);
    // setWithoutBookListBoxValue([]);

    word = word.replaceAll(' ', '+');
    print('searched book:  $word');
    try {
      setFetchingStatus(HttpStatusEnum.waiting);
      Response response =
          await HttpRequests().getRequest("search.json?term=$word");
      print("response: \n\n ${response.data} \n\n");
      if (response.data['pageProps']["pageConfig"]["boxes"] == null &&
          response.data['pageProps']["pageConfig"]["bookList"] == null) {
        print('not found');
        setFetchingStatus(HttpStatusEnum.notFound);
      }
      else if (response.data['pageProps']["pageConfig"]["bookList"] != null) {
        //has booklist
        print('has booklist');
        wBookList.SearchResult searchResult =
            wBookList.SearchResult.fromJson(response.data);
        List<wBookList.Book> books = searchResult.pageProps!.pageConfig!.bookList!.books;
        books.removeWhere((book) => book.type=="Audio");
        setBookListValue(searchResult.pageProps!.pageConfig!.bookList!.books);
        List<wBookList.Box> boxes = searchResult.pageProps!.pageConfig!.boxes;
        boxes.removeWhere((box) => box.title=='کتاب‌های صوتی');
        setBoxValue(boxes);
        setFetchingStatus(HttpStatusEnum.found);

      } else {
        //no booklist
        print('no booklist');
        woBookList.SearchResultWithoutBookList searchResultWithoutBookList =
            woBookList.SearchResultWithoutBookList.fromJson(response.data);
        List<Box> boxes = searchResultWithoutBookList.pageProps!.pageConfig!.boxes;
        boxes.removeWhere((box) => box.title=='کتاب‌های صوتی');
        setWithoutBookListBoxValue(boxes);
        // print(searchResultWithoutBookList.pageProps!.pageConfig!.boxes);
        // print("no booklist but box, boxes: $getWithoutBookListBoxValue");
        setFetchingStatus(HttpStatusEnum.found);
      }
    } on DioError {
      setFetchingStatus(HttpStatusEnum.error);
      rethrow;
    }
  }

}
