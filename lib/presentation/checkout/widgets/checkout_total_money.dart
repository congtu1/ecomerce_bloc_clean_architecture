import 'package:flutter/material.dart';

import '../../../config/theme_constants.dart';
import '../../../config/cus_size.dart';




class CheckoutTotalMoney extends StatelessWidget {
  const CheckoutTotalMoney({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getProportionateScreenWidth(375),
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "EST. TOTAL",
            style: titleStyle,
          ),
          Text(
            "\$240",
            style: titleStyle,
          )
        ],
      ),
    );
  }
}