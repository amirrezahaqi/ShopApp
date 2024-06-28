class HTTpResponceValidator {
  static bool isValidStatusCode(int statusCode) {
    if (statusCode >= 200 && statusCode < 300) {
      return true;
    } else {
      throw HttpExeption(statusCode);
    }
  }
}

class HttpExeption implements Exception {
  final int statusCode;

  HttpExeption(this.statusCode);

  @override
  String toString() {
    String message;

    switch (statusCode) {
      case 400:
        message = 'bad request';

        break;
      case 401:
        message = 'unauthorized';

        break;
      case 403:
        message = 'forbidden';

        break;
      case 409:
        message = 'conflict';

        break;
      case 500:
        message = 'internal server error ';

        break;

      default:
        message = 'unknown error  ';
    }

    return 'HttpExeption : statusCode is $statusCode,  msg:$message ';
  }
}
