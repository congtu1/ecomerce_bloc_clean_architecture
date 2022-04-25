import 'package:flutter/material.dart';


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
            // return const CartListTile();
            return const SizedBox();
          },
          itemCount: 10,
        ),
      ),
    );
  }
}

