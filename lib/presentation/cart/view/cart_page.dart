import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecomerce_ui/common/bloc_status/bloc_status.dart';
import 'package:flutter_ecomerce_ui/config/theme_constants.dart';
import 'package:flutter_ecomerce_ui/presentation/Widgets/cart_list_item.dart';
import 'package:flutter_ecomerce_ui/presentation/Widgets/checkout_default_button.dart';
import 'package:flutter_ecomerce_ui/presentation/cart/bloc/cart_bloc.dart';

import '../../../data_layer/models/models.dart';

class CartPage extends StatelessWidget {
  static Page page() => const MaterialPage<void>(child: CartPage());

  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double total = 0;
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            late Widget widget;
            if (state.carts.isEmpty) {
              if (state.status == BlocStatus.loading) {
                widget = const Center(child: CircularProgressIndicator());
              } else if (state.status != BlocStatus.success) {
                widget = const SizedBox();
              } else {
                widget = Center(
                  child: Text(
                    "Empty",
                    style: titleStyle,
                  ),
                );
              }
            } else {
              total = 0;
              for (CartItemModel i in state.carts) {
                total += i.price * i.amount;
              }
              widget = ListView(
                children: [
                  for (final item in state.carts) CartListTile(item: item),
                ],
              );
            }

            return Column(
              children: [
                Text(
                  "Cart",
                  style: titleStyle,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: widget,
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "SUB TOTAL",
                        style: bodyLargeStyle,
                      ),
                      Text(
                        total.toStringAsFixed(2).toString(),
                        style: bodyLargeStyle,
                      ),
                    ],
                  ),
                ),
                const BottomDefaultButton(
                    text: "BUY NOW", icon: Icons.shopping_bag)
              ],
            );
          },
        ),
      ),
    );
  }
}
