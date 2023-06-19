import 'package:dio/dio.dart';

import '../../models/response_model.dart';
import '../token.dart';

class ResttApiService {
  static const String baseUrl = 'https://yasser39.pythonanywhere.com/';
  final Dio _dio = Dio();

  /* Future<ResponseEntity> getRequest2() async {
    ResponseEntity responseEntity = await restApiService.request(
        'auth/users/me', HttpRequestType.GET,
        sendToken: true, tokenType: TokenType.JWT);
    return responseEntity;
  }*/
  Future<ResponseModel> getRequest(String endpoint, {sendToken = true}) async {
    try {
      Map<String, String> headers = {};
      if (sendToken) {
        String token = await Token().accessToken;
        headers["Authorization"] = "JWT $token";
      }
      var response = await _dio.get('$baseUrl$endpoint',
          options: Options(headers: headers));
      return ResponseModel.complete(data: response.data);
    } on Exception catch (e) {
      return ResponseModel.withError(message: e.toString());
    }
  }

  Future<ResponseModel> postRequest(String endpoint, Map<String, dynamic> body,
      {sendToken = true}) async {
    try {
      Map<String, String> headers = {};
      if (sendToken) {
        String token = await Token().accessToken;
        headers["Authorization"] = "JWT $token";
      }
      var response = await _dio.post(
        '$baseUrl$endpoint',
        data: body,
        options: Options(headers: headers),
      );
      return ResponseModel.complete(data: response.data);
    } on Exception catch (e) {
      return ResponseModel.withError(message: e.toString());
    }
  }
}
