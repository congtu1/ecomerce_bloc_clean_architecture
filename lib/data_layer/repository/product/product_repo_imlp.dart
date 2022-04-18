import 'package:flutter_ecomerce_ui/common/injector/injector.dart';
import 'package:flutter_ecomerce_ui/data_layer/datasuorce/remote/product/product_provider.dart';
import 'package:flutter_ecomerce_ui/data_layer/models/models.dart';
import 'package:flutter_ecomerce_ui/domain/repositories/product_repo.dart';

import '../../../presentation/home/models/models.dart';

class ProductRepositoryImlp extends ProductRepositories {
  final productProvider = getIt.get<ProductProvider>();

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
  Future<List<ProductModel>> fetchProduct() async {
    return productProvider.fetchAllProduct();
  }
}
