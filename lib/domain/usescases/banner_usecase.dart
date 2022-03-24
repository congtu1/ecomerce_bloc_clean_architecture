import 'package:flutter_ecomerce_ui/common/injector/injector.dart';
import 'package:flutter_ecomerce_ui/data_layer/models/banner_model.dart';
import 'package:flutter_ecomerce_ui/data_layer/repository/banner_repository.dart';

class BannerUseCase {
  var bannerRepository = getIt.get<BannerRepositoryImlp>();

  Future<List<BannerModel>> fetchBanner() async {
    return bannerRepository.fetchBanner();
  }
}
