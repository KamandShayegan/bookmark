import 'package:bookmark_codebase/business_logic/services/http_services/dio_service.dart';
import 'package:dio/dio.dart';

class HttpRequests{
  static String baseUrl = 'https://taaghche.com/_next/data/CiaCeUpURWSzM8Dz6LXfK/';

  Future<Response> getRequest(String endPoint) async{
    String url = "$baseUrl$endPoint";
    print('<GET> $url ');
    return await DioService().dio.get(url,  options: Options(
      followRedirects: false,
      validateStatus: (status) {
        return status! < 500;
      },
    ),);
  }

}