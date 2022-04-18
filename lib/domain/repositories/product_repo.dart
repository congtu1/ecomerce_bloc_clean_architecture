import 'package:flutter_ecomerce_ui/data_layer/models/models.dart';

import '../../presentation/home/models/models.dart';

abstract class ProductRepositories {
  Future<List<ProductModel>> fetchProduct();

  Future<List<Product>> fetchNewArrival();

  Future<List<BannerModel>> fetchJustForYou();
}
