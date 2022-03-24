import 'dart:convert';

import 'package:flutter_ecomerce_ui/data_layer/models/models.dart';
import 'package:http/http.dart';

import '../../../../common/http/http_client.dart';
import '../../../../common/injector/injector.dart';

class ProductProvider {
  final httpClient = getIt.get<HttpClients>();

  // fetch all product

  Future<List<ProductModel>> fetchAllProduct() async {
    List<ProductModel> listProduct = [];
    Response res = await httpClient.get("/getAllProduct");
    var rawData = json.decode(res.body);
    for (var item in rawData) {
      var product = ProductModel.fromJson(item);
      listProduct.add(product);
    }
    return listProduct;
  }

// fetch arrival product

  Future<List<ProductModel>> fetchArrivalProduct() async {
    List<ProductModel> listProduct = [];
    Response res = await httpClient.get("/getAllProduct");
    var rawData = json.decode(res.body);
    for (var item in rawData) {
      var product = ProductModel.fromJson(item);
      listProduct.add(product);
    }
    return listProduct;
  }
}
