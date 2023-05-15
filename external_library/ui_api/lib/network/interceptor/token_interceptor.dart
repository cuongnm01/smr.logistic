import 'package:dio/dio.dart';

class TokenInterceptor extends Interceptor {
  static const List<int> unauthorizedTokenCodes = [401];

  TokenInterceptor({required this.errorUnauthorized, required this.error400});

  // @override
  // void onRequest(RequestOptions options, RequestInterceptorHandler handler) {

  //   super.onRequest(options, handler);
  // }

  Function() errorUnauthorized;
  Function(String) error400;

  @override
  void onError(DioError error, ErrorInterceptorHandler handler) {
    print('[TokenInterceptor] onError ->');

    if (error.response?.statusCode == 401) {
      errorUnauthorized();
      print('[TokenInterceptor] onError 401'
          '${error.message}');
    } else if (error.response?.statusCode == 400) {
      error400(error.response?.data['message']);
      print('[TokenInterceptor] onError 400'
          '${error.message}');
    } else {
      super.onError(error, handler);
    }
    // if (error.response == null || error.type != DioErrorType.response) {
    //   return;
    // }
  }

  // @override
  // void onResponse(Response response, ResponseInterceptorHandler handler) {
  //   print('[TokenInterceptor] onResponse ->[${response.statusCode}'
  //       ' ${response.requestOptions.path}] : $response ');

  //   if (unauthorizedTokenCodes.contains(response.statusCode)) {}
  //   return super.onResponse(response, handler);
  // }
}
