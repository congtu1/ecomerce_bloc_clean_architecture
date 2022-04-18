import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/cus_size.dart';

class BottomDefaultButton extends StatelessWidget {
  const BottomDefaultButton({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getProportionateScreenWidth(375),
      height: 56,
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon,color: Colors.white,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(text,style: GoogleFonts.tenorSans(fontSize: 18,color: Colors.white),),
          )
        ],
      ),
    );
  }
}