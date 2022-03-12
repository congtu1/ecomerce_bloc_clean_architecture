import 'package:flutter_ecomerce_ui/domain/entities/auth_token.dart';
import 'package:flutter_ecomerce_ui/presentation/authentication/bloc/authentication_states.dart';
import 'package:http/http.dart';

abstract class AuthRepository {
  Future<void> signIn(dynamic data);
  Future<Response> register(dynamic data);
  Future<void> signOut();

}