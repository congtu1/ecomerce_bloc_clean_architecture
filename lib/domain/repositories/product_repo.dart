import 'package:flutter_ecomerce_ui/data_layer/models/banner_model.dart';

import '../../presentation/home/models/models.dart';

abstract class ProductRepositories {
  Future<List<Product>> fetchProduct();

  Future<List<Product>> fetchNewArrival();

  Future<List<BannerModel>> fetchJustForYou();
}
