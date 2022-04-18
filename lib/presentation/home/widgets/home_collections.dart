import 'package:flutter/material.dart';
import 'package:flutter_ecomerce_ui/config/cus_size.dart';

import 'home_title_text.dart';

class HomeCollections extends StatelessWidget {
  const HomeCollections({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 640,
      width: getProportionateScreenWidth(375),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const TitleText(text: "COLLECTIONS"),
          Image.asset("assets/images/collection1.png"),
          Image.asset("assets/images/collection2.png")
        ],
      ),
    );
  }
}