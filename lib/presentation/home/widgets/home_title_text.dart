import 'package:flutter/material.dart';

import '../../../config/theme_constants.dart';


class TitleText extends StatelessWidget {
  const TitleText({
    Key? key,required this.text
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(text, style: titleStyle,);
  }
}