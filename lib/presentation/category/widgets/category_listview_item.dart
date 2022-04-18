import 'package:flutter/material.dart';
import 'package:flutter_ecomerce_ui/config/theme_constants.dart';
import 'package:flutter_ecomerce_ui/config/cus_size.dart';

class CategoryListViewItem extends StatelessWidget {
  const CategoryListViewItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getProportionateScreenWidth(375),
      height: 140.33,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: Image.asset("assets/images/category_product1.png"),
            flex: 1,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "LAMEREI",
                  style: titleStyle,
                ),
                Text(
                  "Recycle Boucle Knit Cardigan Pink",
                  style: bodyLargeStyle,
                ),
                Text(
                  "\$120",
                  style: bodyLargeStyle,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.orange,
                    ),
                    Text(
                      "4.8 Rating",
                      style: bodyMediumStyle,
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Size",
                      style: bodyMediumStyle,
                    ),
                    Row(
                      children: List.generate(3, (index) {
                        List<String> lists = ["S", "M", "L"];
                        return Container(
                          width: 25,
                          height: 25,
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 0.5)),
                          child: Center(
                            child: Text(
                              lists[index],
                              style: bodySmallStyle,
                            ),
                          ),
                        );
                      }),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.favorite_border,
                      color: Colors.redAccent,
                    )
                  ],
                )
              ],
            ),
            flex: 2,
          )
        ],
      ),
    );
  }
}
