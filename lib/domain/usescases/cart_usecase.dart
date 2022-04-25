import 'package:flutter_ecomerce_ui/common/injector/injector.dart';
import 'package:flutter_ecomerce_ui/data_layer/repository/cart/cart_repository_imlp.dart';

class CartUseCase {
  final cartRepository = getIt.get<CartRepositoryImlp>();


  Future<void> addToCart(int idProduct) {
    return cartRepository.addToCart(idProduct);
  }
}
