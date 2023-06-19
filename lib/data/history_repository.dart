import 'package:dio/dio.dart';
import 'package:rest_api/models/response_entity.dart';
import 'package:rest_api/rest_api.dart';
import 'package:rest_api/rest_api_service.dart';
import 'package:test_1/data/services/rest_api_service.dart';

import '../models/history.dart';
import '../models/response_model.dart';
import 'token.dart';

class HistoryRepository extends ResttApiService {
  RestApiService restApiService =
      RestApiService('https://yasser39.pythonanywhere.com/');
Dio dio=Dio();
 /* Future<ResponseEntity> getHistory2() async {
    ResponseEntity response = await restApiService.request(
      'attendance/records/',
      HttpRequestType.GET,
    );
    Map<String, String?> headers = {
      "Authorization": "JWT ${await Token().accessToken}",
    };

    var response2 = await dio.post(
      'https://yasser39.pythonanywhere.com/attendance/records/',

      options: Options(headers: headers),
    );
    if (!response.hasError) {
      response.data = response.data.map((e) => History.fromJson(e)).toList();
    }
    return response;
  }*/
Future<ResponseModel<List<History>>> getHistory() async {
  try {
    Map<String, String?> headers = {
      "Authorization": "JWT ${await Token().accessToken}",
    };

    var response = await dio.get(
      'https://yasser39.pythonanywhere.com/attendance/records/',
      options: Options(headers: headers),
    );

    List<History> history = [];
    for (var i in response.data) {
      history.add(History.fromJson(i));
    }
    return ResponseModel.complete(data: history);
  } on DioError catch (e) {
    String message =
        e.response == null ? e.message : e.response!.data['detail'];
    if (e.type == DioErrorType.other) {
      return ResponseModel.withError(message: message);
    }
    return ResponseModel.withError(message: message);
  } on Exception catch (e) {
    return ResponseModel.withError(message: e.toString());
  }
}
}
