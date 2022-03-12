
import 'package:http/http.dart';

abstract class AuthenticationDataProvider {

  Future<Response> signIn(data);
  Future<Response> register(data);
  Future<Response> currentUser();
  Future<Response> refresh(data);
  Future<Response> logout();


}