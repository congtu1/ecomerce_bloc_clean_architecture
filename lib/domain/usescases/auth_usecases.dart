import 'package:flutter_ecomerce_ui/common/injector/injector.dart';
import 'package:flutter_ecomerce_ui/data_layer/repository/auth/auth_repo_imlp.dart';

class AuthUseCase {
  final repository = getIt.get<AuthRepoImpl>();

  Future<void> signIn(data) async {
    return await repository.signIn(data);
  }

  Future<void> register(data) async {
    return await repository.register(data);
  }

  Future<void> signOut() async {
    return await repository.signOut();
  }
}