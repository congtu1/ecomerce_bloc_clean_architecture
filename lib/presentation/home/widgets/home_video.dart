import 'package:flutter/material.dart';

import '../../../config/cus_size.dart';


class HomeVideo extends StatelessWidget {
  const HomeVideo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 176,
        width: getProportionateScreenWidth(375),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/video.png"))),
        child: Center(
          child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black.withOpacity(0.2)),
              child: Icon(Icons.play_arrow)),
        ));
  }
}
