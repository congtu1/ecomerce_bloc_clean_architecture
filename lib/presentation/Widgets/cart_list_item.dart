import 'package:flutter/material.dart';
import 'package:flutter_ecomerce_ui/common/http_configs/http_configs.dart';
import 'package:flutter_ecomerce_ui/config/cus_size.dart';
import 'package:flutter_ecomerce_ui/config/theme_constants.dart';
import 'package:flutter_ecomerce_ui/data_layer/models/models.dart';
import 'package:flutter_ecomerce_ui/presentation/cart/bloc/cart_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartListTile extends StatelessWidget {
  const CartListTile({Key? key, required this.item}) : super(key: key);
  final CartItemModel item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 134,
      width: getProportionateScreenWidth(375),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Image.network(
              HttpConfiguration.hostImage + item.image,
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
                    item.name,
                    style: titleStyle,
                  ),
                  Text(
                    "Recycle Boucle Knit Cardigan Pink",
                    style: bodyMediumStyle,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.read<CartBloc>().add(CartItemDecrement(item));
                        },
                        child: Container(
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
                      ),
                      Text(
                        item.amount.toString(),
                        style: titleStyle,
                      ),
                      GestureDetector(
                        onTap: () {
                          context.read<CartBloc>().add(CartItemIncrement(item));
                        },
                        child: Container(
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
                      ),
                    ],
                  ),
                  Text(
                    item.price.toString(),
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
