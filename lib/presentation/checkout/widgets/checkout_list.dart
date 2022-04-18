import 'package:flutter/material.dart';
import 'package:flutter_ecomerce_ui/presentation/Widgets/cart_list_item.dart';

import '../../../config/theme_constants.dart';
import '../../../config/cus_size.dart';

class CheckoutList extends StatelessWidget {
  const CheckoutList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return const CartListItem();
          },
          itemCount: 10,
        ),
      ),
    );
  }
}

