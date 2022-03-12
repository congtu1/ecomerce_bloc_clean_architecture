

import 'dart:io';

import 'package:flutter_ecomerce_ui/common/constants/http_constant.dart';
import 'package:flutter_ecomerce_ui/common/http/http_client.dart';
import 'package:flutter_ecomerce_ui/common/http_configs/http_configs.dart';
import 'package:flutter_ecomerce_ui/data_layer/datasuorce/remote/auth/auth_provider.dart';
import 'package:flutter_ecomerce_ui/data_layer/datasuorce/secure_storage_helper/secure_storage_helper.dart';
import 'package:flutter_ecomerce_ui/data_layer/repository/auth/auth_repo_imlp.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  String? token = await SecureStorageHelper().getUserToken();
  getIt.registerSingleton<HttpConstants>(HttpConstants(authorizationValue: token));
  getIt.registerSingleton(HttpClients(host: HttpConfiguration.host));
  getIt.registerSingleton<AuthProvider>(AuthProvider());
  getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl());
}