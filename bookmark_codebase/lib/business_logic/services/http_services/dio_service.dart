import 'package:dio/dio.dart';


class DioService {
  Dio dio = Dio(
    BaseOptions(
      connectTimeout: 5000,
      receiveTimeout: 5000,
    ),
  );
  // initializeInterceptors() {
  //   dio.interceptors.add(
  //     InterceptorsWrapper(
  //       onError: (error, errorInterceptorHandler) {
  //         print('Dio Interceptor onError: ${error.message}');
  //       },
  //       onRequest: (request, requestInterceptorHandler) {
  //         print(
  //             'Dio Interceptor onRequest: ${request.method} | ${request.path}');
  //       },
  //       onResponse: (response, responseInterceptorHandler) {
  //         print(
  //             'Dio Interceptor onResponse: ${response.statusCode} | ${response.data}');
  //       },
  //     ),
  //   );
  // }
}
