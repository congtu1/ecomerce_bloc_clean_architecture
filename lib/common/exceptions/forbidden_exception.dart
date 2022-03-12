import 'package:flutter_ecomerce_ui/common/constants/exception_constants.dart';
import 'package:flutter_ecomerce_ui/common/exceptions/server_exception.dart';

class ForbiddenException extends ServerException {
  ForbiddenException({required String? message})
      : super(message: message ?? "", code: ExceptionConstants.forbidden);
}
