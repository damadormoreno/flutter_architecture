

class Failure {

  final int code;
  final String message;

  Failure(this.code, this.message);

  /*Failure._();

  factory Failure.dioError(int code, String message) = DioError;
  factory Failure.unauthorizedError(int code, String message) = UnauthorizedError;
  factory Failure.unexpectedError(int code, String message) = UnexpectedError;
  factory Failure.serverError(int code, String message) = ServerError;
  factory Failure.expiredToken() = ExpiredTokenError;
  factory Failure.noDataError() = NoDataError;*/


}

/*class DioError extends Failure {

  DioError(this.code, this.message) : super._();

  final int code;
  final String message;
}

class UnauthorizedError  extends Failure{

  final int code;
  final String message;

  UnauthorizedError(this.code, this.message) : super._();
}

class UnexpectedError  extends Failure{

  final int code;
  final String message;

  UnexpectedError(this.code, this.message) : super._();
}

class ServerError  extends Failure{

  final int code;
  final String message;

  ServerError(this.code, this.message) : super._();
}

class ExpiredTokenError  extends Failure{

  ExpiredTokenError() : super._();
}

class NoDataError  extends Failure{

  NoDataError() : super._();
}*/


