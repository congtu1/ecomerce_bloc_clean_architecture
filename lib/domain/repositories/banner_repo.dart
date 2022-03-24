import '../../data_layer/models/models.dart';

abstract class BannerRepositories {
  Future<List<BannerModel>> fetchBanner();
}
