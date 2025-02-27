import 'package:anantkaal_chat_name/utils/app_preferences.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioUtil {
  final Dio _dioInstance = Dio(BaseOptions(
    connectTimeout: const Duration(milliseconds: 50000),
    receiveTimeout: const Duration(milliseconds: 50000),
  ));

  Dio getDio({bool? useAccessToken, String? token}) {
    _dioInstance.interceptors.clear();

    _dioInstance.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      compact: false,
    ));

    if (useAccessToken ?? false) {
      _dioInstance.interceptors.add(InterceptorsWrapper(
        onRequest: (options, handler) async {
          final accessToken = await AppPreference().getStringFromSF("token");
         options.headers['Authorization'] = 'Bearer $accessToken';
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
      ),);
    }

    // Set default content-type header
    _dioInstance.options.headers['Content-Type'] = 'application/json';

    return _dioInstance;
  }
}

