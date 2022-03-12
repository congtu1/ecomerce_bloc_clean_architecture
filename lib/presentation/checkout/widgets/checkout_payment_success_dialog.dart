

import 'package:flutter/material.dart';
import 'package:flutter_ecomerce_ui/config/cus_size.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../config/theme_constants.dart';


Future<void> showPaymentSuccessDialog(BuildContext context) async {
  return showDialog<void>(context: context, builder: (context) {
    return AlertDialog(
      title: Center(child: Text("PAYMENT SUCCESS",style: titleStyle,)),
      content: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/images/success.png"),
            Text("Your payment was success",style: bodyLargeStyle,),
            Text("Payment ID 15263541",style: bodyMediumStyle,),
            SvgPicture.asset("assets/images/divider.svg"),
            Text("Rate your purchase",style: bodyLargeStyle,),
          ],
        ),
      ),
      actions: [
        Container(
          height: 48,
          width: getProportionateScreenWidth(90),
          decoration: BoxDecoration(
            color: Colors.black
          ),
          child: Center(
            child: Text("SUBMIT",style: bodyLargeStyle,),
          ),
        ),
        Container(
          height: 48,
          width: getProportionateScreenWidth(170),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey)
          ),
          child: Center(
            child: Text("BACK TO HOME",style: titleStyle,),
          ),
        )
      ],
    );
  },);
}