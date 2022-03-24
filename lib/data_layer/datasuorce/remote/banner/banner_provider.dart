import 'package:flutter_ecomerce_ui/common/http_api/http_api_goal.dart';
import 'package:flutter_ecomerce_ui/data_layer/models/models.dart';

import '../../../../common/http/http_client.dart';
import '../../../../common/injector/injector.dart';

class BannerProvider {
  final httpClient = getIt.get<HttpClients>();

  Future<List<BannerModel>> fetchBanner() async {
    List<BannerModel> listBanner = [];
    var res = await httpClient.get(HttpApiGoal.getBanner);
    for (var item in res) {
      var banner = BannerModel.fromJson(item);
      listBanner.add(banner);
    }
    return listBanner;
  }
}
