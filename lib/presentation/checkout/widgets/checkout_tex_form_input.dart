import 'package:flutter/material.dart';

import '../../../config/theme_constants.dart';
import '../../../config/cus_size.dart';


class CheckoutTextFormInput extends StatelessWidget {
  const CheckoutTextFormInput({Key? key, required this.hintText})
      : super(key: key);
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: getProportionateScreenWidth(375),
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: bodyLargeStyle,
        ),
      ),
    );
  }
}
