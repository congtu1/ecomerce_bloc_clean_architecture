import 'package:flutter_ecomerce_ui/common/http/http_client.dart';
import 'package:flutter_ecomerce_ui/common/http_api/http_api_goal.dart';
import 'package:flutter_ecomerce_ui/common/injector/injector.dart';
import 'package:flutter_ecomerce_ui/data_layer/models/cart_item_model.dart';

class CartProvider {
  final httpClient = getIt.get<HttpClients>();

  Future<List<CartItemModel>> fetchMyCart() async {
    List<CartItemModel> list = [];
    try {
      var res = await httpClient.get(HttpApiGoal.fetchMyCart);
      for (var item in res) {
        var cart = CartItemModel.fromJson(item);
        list.add(cart);
      }
    } catch (_) {}
    return list;
  }

  Future<void> addToCart(int idProduct) async {
    Map<String, String> idProducts = {'idProduct': idProduct.toString()};
    try {
      await httpClient.post(HttpApiGoal.addToCart, idProducts);
    } catch (_) {}
  }
}
