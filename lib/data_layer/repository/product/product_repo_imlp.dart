import 'package:flutter_ecomerce_ui/data_layer/models/banner_model.dart';
import 'package:flutter_ecomerce_ui/domain/repositories/product_repo.dart';

import '../../../presentation/home/models/models.dart';

class ProductRepositoryImlp extends ProductRepositories {
  @override
  Future<List<BannerModel>> fetchJustForYou() {
    // TODO: implement fetchJustForYou
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> fetchNewArrival() {
    // TODO: implement fetchNewArrival
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> fetchProduct() {
    // TODO: implement fetchProduct
    throw UnimplementedError();
  }
}
