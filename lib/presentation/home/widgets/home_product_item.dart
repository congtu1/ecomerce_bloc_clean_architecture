import 'package:flutter/material.dart';
import 'package:flutter_ecomerce_ui/common/http_configs/http_configs.dart';
import 'package:flutter_ecomerce_ui/common/injector/injector.dart';
import 'package:flutter_ecomerce_ui/data_layer/models/models.dart';
import 'package:flutter_ecomerce_ui/presentation/app/bloc/app_bloc.dart';
import 'package:flutter_ecomerce_ui/presentation/app/bloc/app_event.dart';
import 'package:flutter_ecomerce_ui/presentation/app/bloc/app_state.dart';

import '../../../config/theme_constants.dart';

class HomeProductItem extends StatelessWidget {
  const HomeProductItem({Key? key, required this.product}) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        return getIt
            .get<AppBloc>()
            .add(AppEventNavigator(AppRoute.productDetail, product));
      },
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Image.network(
              HttpConfiguration.hostImage + product.image,
              fit: BoxFit.fill,
            ),
          ),
          Text(
            product.name,
            style: titleStyle,
            textAlign: TextAlign.center,
          ),
          Text(
            "\$" + product.price.toString(),
            style: titleStyle,
          )
        ],
      ),
    );
  }
}