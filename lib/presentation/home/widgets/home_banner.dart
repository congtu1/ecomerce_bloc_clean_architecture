
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/cus_size.dart';


class HomeBanner extends StatelessWidget {
  const HomeBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550,
      width: getProportionateScreenWidth(375),
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                'assets/images/banner.png',
              ))),
      child: Stack(
        children: [
          Positioned(
            top: getProportionateScreenWidth(231.44),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(36.71)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "LUXURY",
                    style: GoogleFonts.tenorSans(fontSize: 36),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(17.53)),
                    child: Text("FASHION",
                        style: GoogleFonts.tenorSans(fontSize: 36)),
                  ),
                  Text("&ACCESSORIES",
                      style: GoogleFonts.tenorSans(fontSize: 36)),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            child: Container(
              width: getProportionateScreenWidth(253),
              height: 40,
              margin: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(61)),
              decoration: BoxDecoration(
                  color: Color(0xFF000000).withOpacity(0.4),
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                  child: Text(
                    "Explore Collection",
                    style: GoogleFonts.tenorSans(
                        color: Colors.white, fontSize: 18),
                  )),
            ),
          )
        ],
      ),
    );
  }
}