import 'package:anantkaal_chat_name/modules/group_chat/model/group_chat_model.dart';
import 'package:anantkaal_chat_name/utils/constants.dart';
import 'package:anantkaal_chat_name/utils/dio_util.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';
part 'api_services.g.dart';



@RestApi(baseUrl: Constants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  static ApiService create() {
    final dio = DioUtil().getDio(useAccessToken: true,);
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: kDebugMode ? true : false,
      requestBody: kDebugMode ? true : false,
      responseBody: kDebugMode ? true : false,
      responseHeader: kDebugMode ? true : false,

      compact: kDebugMode ? true : false,
    ),);
    return ApiService(dio);
  }

  @POST(Constants.signUp)
  Future<dynamic> signUpPost(
      @Body() Map<String, dynamic> body,);

  @GET(Constants.chat)
  Future<ChatResponseModel> getAllChat(@Query('page') String page);

  @POST(Constants.createChat)
  Future<dynamic> postSendMessage(
      @Body() Map<String, dynamic> body,);


  @POST(Constants.image)
  @MultiPart()
  Future<dynamic> postImagesSent(
      @Body() @MultiPart() FormData formData,);
}
