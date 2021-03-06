import 'package:flutter_ecomerce_ui/data_layer/models/models.dart';

abstract class CartRepository {
  Future<void> addToCart(int idProduct);

  Stream<List<CartItemModel>> getCartStream();
}
