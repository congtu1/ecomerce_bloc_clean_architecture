import 'package:flutter_ecomerce_ui/common/constants/exception_constants.dart';
import 'package:flutter_ecomerce_ui/common/exceptions/server_exception.dart';

class UnauthorisedException extends ServerException {
  UnauthorisedException(String? message)
      : super(
    message: message ?? '',
    code: ExceptionConstants.unauthorized,
  );
}