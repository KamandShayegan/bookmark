import 'package:bookmark_codebase/business_logic/models/json_2_dart/search_result.dart'
    as wBookList;
import 'package:bookmark_codebase/business_logic/models/json_2_dart/search_result_without_booklist.dart'
    as woBookList;
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
        //not found
        print('not found');

        setFetchingStatus(HttpStatusEnum.notFound);
      }
      if (response.data['pageProps']["pageConfig"]["bookList"] != null) {
        //has booklist
        print('has booklist');
        wBookList.SearchResult searchResult =
            wBookList.SearchResult.fromJson(response.data);
        setBookListValue(searchResult.pageProps!.pageConfig!.bookList!.books);
        setBoxValue(searchResult.pageProps!.pageConfig!.boxes);
        setFetchingStatus(HttpStatusEnum.found);

      } else {
        //no booklist
        print('no booklist');
        woBookList.SearchResultWithoutBookList searchResultWithoutBookList =
            woBookList.SearchResultWithoutBookList.fromJson(response.data);
        setWithoutBookListBoxValue(searchResultWithoutBookList.pageProps!.pageConfig!.boxes);
        // print(searchResultWithoutBookList.pageProps!.pageConfig!.boxes);
        // print("no booklist but box, boxes: $getWithoutBookListBoxValue");
        setFetchingStatus(HttpStatusEnum.found);
      }

      // if (response.data['pageProps']["pageConfig"]["boxes"].isEmpty) {
      //   print('no box');
      // } else {
      //
      //   // print("res: ${response.data['pageProps']["pageConfig"]["boxes"]}");
      //   print('has box');
      //   setFetchingStatus(HttpStatusEnum.found);
      // }

      // print("no des res: ${response.data['pageProps']["pageConfig"]}");
      // if(searchResult.pageProps!.pageConfig!.bookList==null){
      //   print('no booklists');
      // }
      // print("all booklist books: ${searchResult.pageProps!.pageConfig!.bookList!.books} \n\n");
      // print("all boxes books: ${searchResult.pageProps!.pageConfig!.boxes}\n\n");
    } on DioError {
      setFetchingStatus(HttpStatusEnum.error);
      rethrow;
    }
  }
}
