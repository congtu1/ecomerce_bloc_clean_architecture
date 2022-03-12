import 'package:flutter_ecomerce_ui/common/constants/exception_constants.dart';
import 'package:flutter_ecomerce_ui/common/exceptions/server_exception.dart';

class ServerErrorException extends ServerException {
  ServerErrorException(String? message)
      : super(
    message: message ?? '',
    code: ExceptionConstants.internalServerError,
  );
}