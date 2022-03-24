import 'package:flutter_ecomerce_ui/common/injector/injector.dart';
import 'package:flutter_ecomerce_ui/data_layer/datasuorce/remote/banner/banner_provider.dart';
import 'package:flutter_ecomerce_ui/data_layer/models/banner_model.dart';
import 'package:flutter_ecomerce_ui/domain/repositories/banner_repo.dart';

class BannerRepositoryImlp extends BannerRepositories {
  var bannerProvider = getIt.get<BannerProvider>();

  @override
  Future<List<BannerModel>> fetchBanner() async {
    return await bannerProvider.fetchBanner();
  }
}
