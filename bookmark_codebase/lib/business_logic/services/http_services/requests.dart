import 'package:bookmark_codebase/business_logic/services/http_services/dio_service.dart';
import 'package:dio/dio.dart';

class HttpRequests{
  static String baseUrl = 'https://taaghche.com/_next/data/Uai8bKdKcyuJlvlT-SAZf/';


  Future<Response> getWithQueryParameters(Map<String, dynamic> queryParameters, String endPoint) async{
    String url = "$baseUrl$endPoint";
    print('<GET> $url ');
    return await DioService().dio.get(url, queryParameters: queryParameters);
  }

}