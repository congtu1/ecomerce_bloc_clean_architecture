import 'package:flutter_ecomerce_ui/common/injector/injector.dart';
import 'package:flutter_ecomerce_ui/data_layer/models/models.dart';
import 'package:flutter_ecomerce_ui/data_layer/repository/product/product_repo_imlp.dart';

class ProductUseCase {
  final productRepository = getIt.get<ProductRepositoryImlp>();

  Future<List<ProductModel>> fetchAllProduct() {
    return productRepository.fetchProduct();
  }
}
