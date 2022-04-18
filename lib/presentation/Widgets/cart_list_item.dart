import 'package:flutter/material.dart';
import 'package:flutter_ecomerce_ui/config/cus_size.dart';
import 'package:flutter_ecomerce_ui/config/theme_constants.dart';

class CartListItem extends StatelessWidget {
  const CartListItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 134,
      margin: const EdgeInsets.symmetric(vertical: 8),
      width: getProportionateScreenWidth(375),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Image.asset(
              "assets/images/product1.png",
              fit: BoxFit.fitHeight,
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "LAMEREI",
                    style: titleStyle,
                  ),
                  Text(
                    "Recycle Boucle Knit Cardigan Pink",
                    style: bodyMediumStyle,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 25,
                        width: 25,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, border: Border.all()),
                        child: Center(
                          child: Text(
                            "-",
                            style: titleStyle,
                          ),
                        ),
                      ),
                      Text(
                        "1",
                        style: titleStyle,
                      ),
                      Container(
                        height: 25,
                        width: 25,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, border: Border.all()),
                        child: Center(
                          child: Text(
                            "+",
                            style: titleStyle,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "\$120",
                    style: titleStyle,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
