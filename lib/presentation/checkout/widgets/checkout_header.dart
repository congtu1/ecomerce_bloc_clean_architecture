import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../config/theme_constants.dart';



class CheckoutHeader extends StatelessWidget {
  const CheckoutHeader({Key? key,required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Center(
            child: Text(
              title,
              style: titleStyle,
            ),
          ),
        ),
        SvgPicture.asset("assets/images/divider.svg"),
      ],
    );
  }
}
