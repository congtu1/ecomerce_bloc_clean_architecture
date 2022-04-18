import 'package:flutter/material.dart';
import 'package:flutter_ecomerce_ui/presentation/home/widgets/home_title_text.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BlogTitle extends StatelessWidget {
  const BlogTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          const TitleText(text: "B L O G"),
          SvgPicture.asset("assets/images/divider.svg")
        ],
      ),
    );
  }
}
