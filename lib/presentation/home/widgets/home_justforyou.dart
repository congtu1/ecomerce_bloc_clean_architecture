import 'package:flutter/material.dart';

import '../../../config/cus_size.dart';
import '../utils.dart';
import 'home_product_item.dart';
import 'home_title_text.dart';

class HomeJustForYou extends StatelessWidget {
  const HomeJustForYou({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitleText(
          text: 'Just For You',
        ),
        SizedBox(
          height: 450,
          child: ListView.builder(
            itemCount: listProduct.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return SizedBox(
                width: getProportionateScreenWidth(255),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: HomeProductItem(
                    product: listProduct[index],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}