class AppExceptions implements Exception {
  final message;
  final prefix;
  AppExceptions([this.message, this.prefix]);

  String toString() {
    return "$prefix $message";
  }
}

class InternetException extends AppExceptions {
  InternetException([String? mesage]) : super(mesage, "No Internet");
}

class RequestTimeOut extends AppExceptions {
  RequestTimeOut([String? message]) : super(message, 'Request Time Out');
}

class ServerException extends AppExceptions {
  ServerException([String? message]) : super(message, 'Internal Server Error');
}