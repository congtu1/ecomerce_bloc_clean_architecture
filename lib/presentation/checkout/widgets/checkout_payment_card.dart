import 'package:flutter/material.dart';

import '../../../config/theme_constants.dart';
class CheckoutPaymentCard extends StatelessWidget {
  const CheckoutPaymentCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Spacer(),
              Image.asset("assets/images/MasterCard.png")
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Iris Watson",
                style: bodyLargeStyle,
              ),
              Text(
                "03/25",
                style: bodyLargeStyle,
              )
            ],
          )
        ],
      ),
    );
  }
}