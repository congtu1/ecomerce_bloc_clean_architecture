import 'package:flutter_ecomerce_ui/common/constants/http_constant.dart';
import 'package:flutter_ecomerce_ui/common/http_utils/http_utils.dart';
import 'package:flutter_ecomerce_ui/common/injector/injector.dart';

import 'package:http/http.dart';

class HttpClients {
  Client? client;
  String host;

  HttpClients({required this.host, this.client}) {
    client ??= Client();
  }

  Uri _getParsedUrl(String path) {
    return Uri.parse('$host$path');
  }

  _generateAuthorizationHeader() {
    Map<String, String> header = {};
    try {
      String authToken = getIt.get<HttpConstants>().getAuthValue.toString();
      if (authToken.isNotEmpty) {
        header.addAll({
          HttpConstants.contentType: HttpConstants.jsonContentType,
          HttpConstants.accept: HttpConstants.jsonContentType,
          HttpConstants.authorization: "Bearer $authToken",
        });
      } else {
        header.addAll({
          HttpConstants.contentType: HttpConstants.jsonContentType,
          HttpConstants.accept: HttpConstants.jsonContentType,
        });
      }
    } catch(_) {}
    return header;
  }


  dynamic get(String path) async {
    Response? response;
    final requestHeader = _generateAuthorizationHeader();
    response = await client!.get(
      _getParsedUrl(path),
      headers: requestHeader,
    );
    return HttpUtils.getResponse(
      response,
    );
  }

  dynamic post(String path, dynamic data) async {
    Response? response;
    final requestHeader = _generateAuthorizationHeader();
    response = await client!.post(
      _getParsedUrl(path),
      body: HttpUtils.encodeRequestBody(
          data, requestHeader[HttpConstants.contentType]!),
      headers: requestHeader,
    );
    return HttpUtils.getResponse(
      response,
    );
  }
  // postFile(apiUrl,File? data) async {
  //   var fullUrl = _rootUrl + apiUrl;
  //   await getToken();
  //   http.MultipartRequest request = http.MultipartRequest("POST", convertFromString(fullUrl));
  //   http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
  //       'file', data!.path);
  //   request.files.add(multipartFile);
  //   request.headers.addAll(_setHeadersFileWithAuth());
  //   http.StreamedResponse response = await request.send();
  //   var res = await http.Response.fromStream(response);
  //   return res;
  // }

}