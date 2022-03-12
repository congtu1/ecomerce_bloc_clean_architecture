import 'package:flutter/material.dart';
import 'package:flutter_ecomerce_ui/presentation/home/models/models.dart';

import '../../../config/theme_constants.dart';


class HomeProductItem extends StatelessWidget {
  const HomeProductItem({
    Key? key,required this.product
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisSize: MainAxisSize.min,
      crossAxisAlignment:
      CrossAxisAlignment.center,
      mainAxisAlignment:
      MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Image.asset(
            product.image,
            fit: BoxFit.fill,
          ),
        ),
        Text(
          product.name,
          style: titleStyle,
          textAlign: TextAlign.center,
        ),
        Text(
          "\$" +
              product
                  .price
                  .toString(),
          style: titleStyle,
        )
      ],
    );
  }
}