import 'package:flutter_ecomerce_ui/common/injector/injector.dart';
import 'package:flutter_ecomerce_ui/data_layer/models/cart_item_model.dart';
import 'package:flutter_ecomerce_ui/data_layer/repository/cart/cart_repository_imlp.dart';

class CartUseCase {
  final cartRepository = getIt.get<CartRepositoryImlp>();

  Future<List<CartItemModel>> fetchMyCart() {
    return cartRepository.fetchMyCart();
  }

  Future<void> addToCart(int idProduct) {
    return cartRepository.addToCart(idProduct);
  }
}
