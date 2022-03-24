
import 'package:flutter_ecomerce_ui/common/http/http_client.dart';
import 'package:flutter_ecomerce_ui/common/injector/injector.dart';
import 'package:flutter_ecomerce_ui/data_layer/models/models.dart';
import 'package:http/http.dart';

class AuthProvider {
  final httpClient = getIt.get<HttpClients>();

  Future<AuthenticationToken> signIn(data) async {
    var res = await httpClient.post("/login", data);
    return AuthenticationToken.fromJson(res);
  }

  Future<AuthenticationToken> register(data) async {
    var res = await httpClient.post("/register", data);

    return AuthenticationToken.fromJson(res);
  }

  Future<Response> signOut() async {
    Response res = await httpClient.get("/login");
    return res;
  }

  Future<User> currentUser() async {
    var res = await httpClient.get("/currentUser");
    return User.fromJson(res);
  }
}