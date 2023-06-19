import 'package:rest_api/models/response_entity.dart';
import 'package:rest_api/rest_api.dart';
import 'package:rest_api/rest_api_service.dart';
import 'package:test_1/data/services/rest_api_service.dart';
import 'package:test_1/data/token.dart';
import 'package:test_1/models/response_model.dart';

import '../models/user.dart';

class UserRepository extends ResttApiService {
  @override
  RestApiService restApiService =
  RestApiService('https://yasser39.pythonanywhere.com/');
  Future<ResponseEntity> login2(User user) async {
    ResponseEntity response = await restApiService
        .request('auth/jwt/create/', HttpRequestType.POST, body: user.toJson(),decode: false);
    if (!response.hasError) {
      Token().setTokens(
        access: response.data['access'],
        refresh: response.data['refresh'],
      );
    }
    return response;
  }

  Future<bool> validateToken() async {
    var response = await getRequest('auth/users/me/');

    return !response.hasError;
  }
}

