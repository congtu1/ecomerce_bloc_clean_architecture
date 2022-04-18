import 'package:flutter_ecomerce_ui/data_layer/models/models.dart';

class HomeResponse {
  List<BannerModel> homeBanner;
  List<ProductModel> homeArrival;

  HomeResponse({required this.homeBanner, required this.homeArrival});
}
