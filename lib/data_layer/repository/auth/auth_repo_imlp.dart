import 'dart:async';
import 'dart:convert';

import 'package:flutter_ecomerce_ui/common/injector/injector.dart';
import 'package:flutter_ecomerce_ui/config/show_snackbar.dart';
import 'package:flutter_ecomerce_ui/data_layer/datasuorce/remote/auth/auth_provider.dart';
import 'package:flutter_ecomerce_ui/data_layer/datasuorce/secure_storage_helper/secure_storage_helper.dart';
import 'package:flutter_ecomerce_ui/data_layer/models/authentication_token.dart';
import 'package:flutter_ecomerce_ui/data_layer/models/user.dart';
import 'package:flutter_ecomerce_ui/domain/entities/auth_token.dart';
import 'package:flutter_ecomerce_ui/domain/repositories/auth_repo.dart';
import 'package:flutter_ecomerce_ui/presentation/authentication/bloc/authentication_states.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/src/response.dart';

class AuthRepoImpl extends AuthRepository {
  final authProvider = getIt.get<AuthProvider>();
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  final _controller = StreamController<AuthenticationStatus>();
  final SecureStorageHelper secureStorageHelper = SecureStorageHelper();

  // AuthRepoImpl({required this.authProvider});

  Stream<AuthenticationStatus> get status async* {
    String? token = await secureStorageHelper.getUserToken();
    if (token != null && token.isNotEmpty) {
      yield AuthenticationStatus.authenticated;
    }
    else {
      yield AuthenticationStatus.unauthenticated;
    }
    yield* _controller.stream;
  }

  @override
  Future<Response> register(data) {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  Future<void> signIn(data) async {
    AuthenticationToken authToken = await authProvider.signIn(data);
    secureStorageHelper.storeToken(authToken.accessToken!, authToken.refreshToken!);
    _controller.add(AuthenticationStatus.authenticated);
  }

  @override
  Future<void> signOut() async {
    Response res = await authProvider.signOut();

  }

  Future<User?> getCurrentUser() async {
    User? user;
      await authProvider.currentUser().then((value) {
        user = User.fromJson(json.decode(value.body));
      });
    return user ?? User.empty;

  }

  set addEventAuthStream(AuthenticationStatus status) =>
      _controller.add(status);



}