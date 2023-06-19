class AppException implements Exception {
  final String _message;

  AppException(this._message) : super();

  @override
  String toString() => _message;
}

class FetchDataException extends AppException {
  FetchDataException(int statusCode) : super('');
}

class InternetConnectionException extends AppException {
  InternetConnectionException() : super('لا يوجد اتصال بالانترنت');
}

class WeakInternetConnection extends AppException {
  WeakInternetConnection() : super('انتهت مهلة الانتظار');
}

class NotFoundException extends AppException {
  NotFoundException() : super('Not found');
}

class UnAuthorizedException extends AppException {
  UnAuthorizedException() : super('المستخدم غير موجود');
}

class BadRequestException extends AppException {
  BadRequestException() : super('Bad Request');
}
