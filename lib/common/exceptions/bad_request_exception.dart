import 'package:flutter_ecomerce_ui/common/constants/exception_constants.dart';
import 'package:flutter_ecomerce_ui/common/exceptions/server_exception.dart';

class BadRequestException extends ServerException {
  BadRequestException({required String? message})
      : super(message: message ?? "", code: ExceptionConstants.badRequest);
}
