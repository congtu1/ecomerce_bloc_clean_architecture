import 'package:flutter/material.dart';
import 'package:flutter_ecomerce_ui/config/theme_constants.dart';
import 'package:flutter_ecomerce_ui/presentation/Widgets/cart_list_item.dart';
import 'package:flutter_ecomerce_ui/presentation/Widgets/checkout_default_button.dart';

class CartPage extends StatelessWidget {
  static Page page() => const MaterialPage<void>(child: CartPage());

  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(
              "Cart",
              style: titleStyle,
            ),
            Expanded(
              child: ListView(
                children: const [CartListItem()],
              ),
            ),
            const Divider(),
            Row(
              children: const [
                Text("SUB TOTAL"),
                Text("\$240"),
              ],
            ),
            const BottomDefaultButton(text: "BUY NOW", icon: Icons.shopping_bag)
          ],
        ),
      ),
    );
  }
}
