import 'package:bookmark_codebase/business_logic/models/json_2_dart/search_result.dart';
import 'package:bookmark_codebase/business_logic/services/http_services/requests.dart';
import 'package:bookmark_codebase/utils/enums/http_status_enums.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class SearchBookProvider extends ChangeNotifier{

  List<Box> _boxes =[];

  List<Box> get boxes=> _boxes;

  setBoxValue(List<Box> boxes){
    _boxes = boxes;
    notifyListeners();
  }

  HttpStatusEnum _fetchingStatus= HttpStatusEnum.idle;

  HttpStatusEnum get fetchingStatus => _fetchingStatus;

  setFetchingStatus(HttpStatusEnum stat){
    _fetchingStatus = stat;
    notifyListeners();
  }

  Future searchBook(String word) async{
    word = word.replaceAll(' ', '+');
    print('search book:  $word');
    try{
      setFetchingStatus(HttpStatusEnum.waiting);
      Response response = await HttpRequests().getWithQueryParameters({'term':word}, "search.json");
      SearchResult searchResult = SearchResult.fromJson(response.data);
      setFetchingStatus(HttpStatusEnum.done);
      setBoxValue(searchResult.pageProps!.pageConfig!.boxes??[]);
    } on DioError{
      setFetchingStatus(HttpStatusEnum.error);
      rethrow;
    }
  }

}