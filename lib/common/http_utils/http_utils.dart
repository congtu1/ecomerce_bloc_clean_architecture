import 'dart:convert';

import 'package:flutter_ecomerce_ui/common/constants/exception_constants.dart';
import 'package:flutter_ecomerce_ui/common/constants/http_constant.dart';
import 'package:flutter_ecomerce_ui/common/exceptions/bad_request_exception.dart';
import 'package:flutter_ecomerce_ui/common/exceptions/forbidden_exception.dart';
import 'package:flutter_ecomerce_ui/common/exceptions/unauthorized_exception.dart';
import 'package:http/http.dart';

import '../exceptions/server_errror_exception.dart';

class HttpUtils {
  static dynamic encodeRequestBody(dynamic data, String contentType) {
    return contentType == HttpConstants.jsonContentType
        ? utf8.encode(json.encode(data))
        : data;
  }
  static String getErroredResult(dynamic result) {
    if (result['error'] is String) {
      return result['error'];
    } else if (result['message'] is String) {
      return result['message'];
    }
    return ExceptionConstants.somethingWentWrong;
  }
  static dynamic getResponse(Response? response) {
    print(response!.body.toString());
    switch (response.statusCode) {
      case 200:
        final responseJson = json.decode(response.body);
        return responseJson;
      case 201:
        throw Exception("Loi 201");
      case 204:
        throw Exception("Loi 204");
      case 400:
        throw BadRequestException(
          message: getErroredResult(json.decode(response.body)),
        );
      case 401:
        throw UnauthorisedException(
          getErroredResult(json.decode(response.body)),
        );
      case 403:
        throw ForbiddenException(
          message: getErroredResult(json.decode(response.body)),
        );
      case 500:
        throw Exception("Loi 500");
      default:
        throw ServerErrorException(
          getErroredResult(json.decode(response.body)),
        );
    }
  }
}