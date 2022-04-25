import 'package:flutter_ecomerce_ui/common/http/http_client.dart';
import 'package:flutter_ecomerce_ui/common/http_api/http_api_goal.dart';
import 'package:flutter_ecomerce_ui/common/injector/injector.dart';
import 'package:flutter_ecomerce_ui/data_layer/models/cart_item_model.dart';
import 'package:flutter_ecomerce_ui/data_layer/models/models.dart';
import 'package:rxdart/rxdart.dart';

class CartProvider {
  CartProvider() {
    _fetchMyCart();
  }

  final httpClient = getIt.get<HttpClients>();
  final _cartStreamController =
      BehaviorSubject<List<CartItemModel>>.seeded(const []);

  Stream<List<CartItemModel>> getCarts() =>
      _cartStreamController.asBroadcastStream();

  void _fetchMyCart() async {
    final List<CartItemModel> list = [];
    try {
      var res = await httpClient.get(HttpApiGoal.fetchMyCart);
      for (var item in res) {
        var cart = CartItemModel.fromJson(item);
        list.add(cart);
      }
    } catch (_) {}
    _cartStreamController.add(list);
  }

  Future<void> addToCart(int idProduct) async {
    Map<String, String> idProducts = {'idProduct': idProduct.toString()};
    final carts = [..._cartStreamController.value];
    try {
      var res = await httpClient.post(HttpApiGoal.addToCart, idProducts);
      final itemModel = CartItemModel.fromJson(res);
      carts.add(itemModel);
    } catch (_) {}
    _cartStreamController.add(carts);
  }

  Future<void> incrementAmount(CartItemModel item) async {
    int amount = item.amount + 1;
    Map<String, String> itemUpdate = {
      'idCart': item.id.toString(),
      'amount': amount.toString()
    };
    final carts = [..._cartStreamController.value];
    try {
      await httpClient.post("/updateCartAmount", itemUpdate);
      final cartIndex = carts.indexWhere((t) => t.id == item.id);
      if (carts[cartIndex].amount > 0) {
        carts[cartIndex] = item.copyWith(amount: item.amount + 1);
      }
    } catch (_) {}
    return _cartStreamController.add(carts);
  }

  Future<void> decrementAmount(CartItemModel item) async {
    int amount = item.amount - 1;
    Map<String, String> itemUpdate = {
      'idCart': item.id.toString(),
      'amount': amount.toString()
    };
    final carts = [..._cartStreamController.value];
    try {
      await httpClient.post("/updateCartAmount", itemUpdate);
      final cartIndex = carts.indexWhere((t) => t.id == item.id);
      if (carts[cartIndex].amount > 0) {
        carts[cartIndex] = item.copyWith(amount: item.amount - 1);
      }
    } catch (_) {}
    return _cartStreamController.add(carts);
  }
}
