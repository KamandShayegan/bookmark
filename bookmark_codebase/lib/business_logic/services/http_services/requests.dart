import 'package:bookmark_codebase/business_logic/services/http_services/dio_service.dart';
import 'package:dio/dio.dart';

class HttpRequests{
  static String baseUrl = 'https://taaghche.com/_next/data/Uai8bKdKcyuJlvlT-SAZf/';
  Future searchBook(String word) async{
    String url = "${baseUrl}search.json";
    word = word.replaceAll(' ', '+');
    print('given word to search $word');
    print('<GET> $url');
    try{
      Response response = await DioService().dio.get(url, queryParameters: {'term':word});
      return response;
    } on DioError{
      rethrow;
    }

}

}