import 'package:dio/dio.dart';

class TokenInterceptor extends Interceptor {
  static const List<int> unauthorizedTokenCodes = [401];

  TokenInterceptor({
    required this.errorUnauthorized,
    required this.errorMsg,
    required this.errorAction,
  });

  Function() errorUnauthorized;
  Function(String) errorMsg;
  Function(String, bool?) errorAction;
  @override
  void onError(DioError error, ErrorInterceptorHandler handler) {
    // ignore: avoid_print
    print('[TokenInterceptor] onError ->');

    if (error.response?.statusCode == 401) {
      errorUnauthorized();
      // ignore: avoid_print
      print('[TokenInterceptor] onError 401 ${error.message}');
    } else if (error.response?.statusCode == 400) {
      errorAction(
          error.response?.data['message'], error.response?.data['isLogin']);
      // ignore: avoid_print
      print('[TokenInterceptor] onError 400 ${error.message}');
    } else if (error.response?.statusCode == 500) {
      errorMsg(error.response?.data['message']);
      // ignore: avoid_print
      print('[TokenInterceptor] onError 500 ${error.message}');
    } else if (error.response?.statusCode == 404) {
      errorMsg(error.response?.data['message']);
      // ignore: avoid_print
      print('[TokenInterceptor] onError 500 ${error.message}');
    } else {
      errorMsg(error.response?.data['message']);
      super.onError(error, handler);
    }
  }
}
