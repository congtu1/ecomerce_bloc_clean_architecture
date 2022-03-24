import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarEx extends AppBar {
  AppBarEx({Key? key})
      : super(
          key: key,
          elevation: 0,
          centerTitle: true,
          backgroundColor: const Color(0xFFE7EAEF),
          primary: true,
          // backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: SvgPicture.asset("assets/icons/Menu.svg"),
            onPressed: () {},
          ),
          title: SvgPicture.asset(
            "assets/images/Logo.svg",
          ),
          actions: [
            IconButton(
              icon: SvgPicture.asset("assets/icons/Search.svg"),
              onPressed: () {},
            ),
            IconButton(
              icon: Image.asset("assets/icons/shopping bag.png"),
              onPressed: () {},
            )
          ],
        );
}