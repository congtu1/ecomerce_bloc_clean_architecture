import 'package:flutter_ecomerce_ui/common/injector/injector.dart';
import 'package:flutter_ecomerce_ui/data_layer/datasuorce/local/cart/cart_local_data_provider.dart';
import 'package:flutter_ecomerce_ui/data_layer/datasuorce/remote/cart/cart_provider.dart';
import 'package:flutter_ecomerce_ui/data_layer/models/cart_item_model.dart';
import 'package:flutter_ecomerce_ui/data_layer/models/models.dart';
import 'package:flutter_ecomerce_ui/data_layer/repository/auth/auth_repo_imlp.dart';
import 'package:flutter_ecomerce_ui/domain/repositories/cart_repo.dart';
import 'package:flutter_ecomerce_ui/presentation/app/bloc/app_bloc.dart';
import 'package:flutter_ecomerce_ui/presentation/app/bloc/app_event.dart';
import 'package:flutter_ecomerce_ui/presentation/app/bloc/app_state.dart';
import 'package:flutter_ecomerce_ui/presentation/authentication/bloc/authentication_bloc.dart';
import 'package:flutter_ecomerce_ui/presentation/authentication/bloc/authentication_states.dart';

class CartRepositoryImlp implements CartRepository {
  final localDatabase = getIt.get<LocalCartProvider>();
  final cartProvider = getIt.get<CartProvider>();
  final authRepository = getIt.get<AuthRepoImpl>();
  final authBloc = getIt.get<AuthenticationBloc>();
  final appRoute = getIt.get<AppBloc>();

  @override
  Future<void> addToCart(int idProduct) async {
    try {
      if (authBloc.state.status == AuthenticationStatus.authenticated) {
        cartProvider.addToCart(idProduct);
        appRoute.add(AppEventNavigator(AppRoute.cart));
      } else {
        Map<String, String> newItem = {
          'idProduct': idProduct.toString(),
          'status': 0.toString()
        };
        localDatabase.newLiteCart(newItem);
        appRoute.add(AppEventNavigator(AppRoute.login));
      }
    } catch (_) {}
  }

  @override
  Future<List<CartItemModel>> fetchMyCart() {
    return cartProvider.fetchMyCart();
  }
}
