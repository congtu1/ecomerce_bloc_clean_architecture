import 'package:flutter_ecomerce_ui/common/constants/http_constant.dart';
import 'package:flutter_ecomerce_ui/common/http/http_client.dart';
import 'package:flutter_ecomerce_ui/common/http_configs/http_configs.dart';
import 'package:flutter_ecomerce_ui/data_layer/datasuorce/local/cart/cart_local_data_provider.dart';
import 'package:flutter_ecomerce_ui/data_layer/datasuorce/remote/auth/auth_provider.dart';
import 'package:flutter_ecomerce_ui/data_layer/datasuorce/remote/banner/banner_provider.dart';
import 'package:flutter_ecomerce_ui/data_layer/datasuorce/remote/cart/cart_provider.dart';
import 'package:flutter_ecomerce_ui/data_layer/datasuorce/remote/product/product_provider.dart';
import 'package:flutter_ecomerce_ui/data_layer/datasuorce/secure_storage_helper/secure_storage_helper.dart';
import 'package:flutter_ecomerce_ui/data_layer/repository/auth/auth_repo_imlp.dart';
import 'package:flutter_ecomerce_ui/data_layer/repository/banner_repository.dart';
import 'package:flutter_ecomerce_ui/data_layer/repository/cart/cart_repository_imlp.dart';
import 'package:flutter_ecomerce_ui/data_layer/repository/product/product_repo_imlp.dart';
import 'package:flutter_ecomerce_ui/domain/usescases/auth_usecases.dart';
import 'package:flutter_ecomerce_ui/domain/usescases/banner_usecase.dart';
import 'package:flutter_ecomerce_ui/domain/usescases/cart_usecase.dart';
import 'package:flutter_ecomerce_ui/domain/usescases/product_usecase.dart';
import 'package:flutter_ecomerce_ui/presentation/app/bloc/app_bloc.dart';
import 'package:flutter_ecomerce_ui/presentation/authentication/bloc/authentication_bloc.dart';
import 'package:flutter_ecomerce_ui/presentation/cart/bloc/cart_bloc.dart';
import 'package:flutter_ecomerce_ui/presentation/login_register/bloc/login_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  getIt.registerSingleton<AppBloc>(AppBloc());
  //Common
  String? token = await SecureStorageHelper().getUserToken();
  getIt.registerSingleton<SecureStorageHelper>(SecureStorageHelper());
  getIt.registerSingleton<HttpConstants>(
      HttpConstants(authorizationValue: token ?? ""));
  getIt.registerSingleton<HttpClients>(
      HttpClients(host: HttpConfiguration.host, client: Client()));

//provider
  getIt.registerSingleton<LocalCartProvider>(LocalCartProvider());
  getIt.registerSingleton<BannerProvider>(BannerProvider());
  getIt.registerSingleton<AuthProvider>(AuthProvider());
  getIt.registerSingleton<ProductProvider>(ProductProvider());
  getIt.registerSingleton<CartProvider>(CartProvider());
  //repository
  getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl());
  getIt.registerSingleton<AuthenticationBloc>(
      AuthenticationBloc(authenticationRepository: getIt.get<AuthRepoImpl>()));
// repository
  getIt.registerSingleton<BannerRepositoryImlp>(BannerRepositoryImlp());
  getIt.registerSingleton<ProductRepositoryImlp>(ProductRepositoryImlp());
  getIt.registerSingleton<CartRepositoryImlp>(CartRepositoryImlp());
  //useCase

  getIt.registerLazySingleton(() => AuthUseCase());
  getIt.registerSingleton<BannerUseCase>(BannerUseCase());
  getIt.registerSingleton<ProductUseCase>(ProductUseCase());
  getIt.registerSingleton<CartUseCase>(CartUseCase());

  //F Bloc
  getIt.registerFactory<LoginCubit>(() => LoginCubit());
  getIt.registerSingleton<CartBloc>(CartBloc());
}
