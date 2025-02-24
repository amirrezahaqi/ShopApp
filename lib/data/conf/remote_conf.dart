import 'package:dio/dio.dart';
import 'package:shopnew/utils/shared_prefrences_keys.dart';
import 'package:shopnew/utils/shared_prefrences_manager.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    String? token =
        SharedPrefrencesManager().getString(SharedPrefrencesKeys.token);
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    super.onRequest(options, handler);
    // ignore: avoid_print
    print(token);
  }
}

class DioManager {
  static final Dio _dio = Dio();
  static Dio get dio {
    _dio.interceptors.add(AuthInterceptor());
    return _dio;
  }
}
