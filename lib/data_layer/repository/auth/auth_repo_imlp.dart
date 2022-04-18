import 'dart:async';

import 'package:flutter_ecomerce_ui/common/constants/http_constant.dart';
import 'package:flutter_ecomerce_ui/common/injector/injector.dart';
import 'package:flutter_ecomerce_ui/data_layer/datasuorce/remote/auth/auth_provider.dart';
import 'package:flutter_ecomerce_ui/data_layer/datasuorce/secure_storage_helper/secure_storage_helper.dart';
import 'package:flutter_ecomerce_ui/data_layer/models/models.dart';
import 'package:flutter_ecomerce_ui/domain/repositories/auth_repo.dart';
import 'package:flutter_ecomerce_ui/presentation/authentication/bloc/authentication_states.dart';

class AuthRepoImpl extends AuthRepository {
  final authProvider = getIt.get<AuthProvider>();
  final _controller = StreamController<AuthenticationStatus>();
  final SecureStorageHelper secureStorageHelper = SecureStorageHelper();

  Stream<AuthenticationStatus> get status async* {
    User user = await getCurrentUser();
    if (user.isNotEmpty) {
      print(user.toString());
      yield AuthenticationStatus.authenticated;
    } else {
      yield AuthenticationStatus.unauthenticated;
    }
    yield* _controller.stream;
  }

  @override
  Future<void> register(data) async {
    AuthenticationToken authToken = await authProvider.register(data);
    getIt
        .get<HttpConstants>()
        .setAuthorizationValue(authToken.accessToken.toString());
    secureStorageHelper.storeToken(
        authToken.accessToken!, authToken.refreshToken!);
    _controller.add(AuthenticationStatus.authenticated);
  }

  @override
  Future<void> signIn(data) async {
    AuthenticationToken authToken = await authProvider.signIn(data);
    secureStorageHelper.storeToken(
        authToken.accessToken!, authToken.refreshToken!);
    getIt
        .get<HttpConstants>()
        .setAuthorizationValue(authToken.accessToken.toString());
    _controller.add(AuthenticationStatus.authenticated);
  }

  @override
  Future<void> signOut() async {
    await authProvider.signOut();
    await secureStorageHelper.deleteAll();
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  Future<User> getCurrentUser() async {
    User user = await authProvider.currentUser();
    return user;
  }

  set addEventAuthStream(AuthenticationStatus status) =>
      _controller.add(status);
}
