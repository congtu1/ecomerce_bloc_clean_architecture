import 'dart:convert';

import 'package:flutter_ecomerce_ui/common/http/http_client.dart';
import 'package:flutter_ecomerce_ui/common/injector/injector.dart';
import 'package:flutter_ecomerce_ui/data_layer/models/authentication_token.dart';
import 'package:http/http.dart';

class AuthProvider {
  final httpClient = getIt.get<HttpClients>();

  Future<AuthenticationToken> signIn(data) async {
    Response res = await httpClient.post("/login", data);
    return AuthenticationToken.fromJson(json.decode(res.body));
  }
  Future<AuthenticationToken> register(data) async {
    Response res = await httpClient.post("/register", data);
    return AuthenticationToken.fromJson(json.decode(res.body));
  }

  Future<Response> signOut() async {
    Response res = await httpClient.get("/login");
    return res;
  }
  Future<Response> currentUser() async {
    Response res = await httpClient.get("/currentUser");
    return res;
  }
}