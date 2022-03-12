import 'package:flutter/material.dart';
import 'package:flutter_ecomerce_ui/config/theme_constants.dart';
import 'package:flutter_ecomerce_ui/config/cus_size.dart';
import 'package:flutter_ecomerce_ui/presentation/Widgets/appbar.dart';
import 'package:flutter_ecomerce_ui/presentation/checkout/widgets/checkout_default_button.dart';
import 'package:flutter_ecomerce_ui/presentation/checkout/widgets/checkout_header.dart';
import 'package:flutter_ecomerce_ui/presentation/checkout/widgets/checkout_list.dart';
import 'package:flutter_ecomerce_ui/presentation/checkout/widgets/checkout_total_money.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CustomSize().init(context);
    return Scaffold(
      appBar: AppBarEx(),
      body: SafeArea(
        child: Column(
          children: [
            const CheckoutHeader(title: "C H E C K O U T",),
            CheckoutList(),
            Container(
              height: 117.54,
              width: getProportionateScreenWidth(375),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(width: 1.0, color: Colors.grey.withOpacity(0.5)),
                  bottom:BorderSide(width: 1.0, color: Colors.grey.withOpacity(0.5)),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.airplane_ticket,size: 30,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text("Add promocode",style: bodyLargeStyle,),
                        )
                      ],
                    ),
                  ),
                  Divider(color: Colors.grey.withOpacity(0.5),
                  height: 1.0,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.car_rental,size: 30,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text("Delivery",style: bodyLargeStyle,),
                        ),
                        Spacer(),
                        Text("Free",style: bodyLargeStyle)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            CheckoutTotalMoney(),
            CheckoutDefaultButton(icon: Icons.shopping_bag,text: "CHECKOUT",)
          ],
        ),
      ),
    );
  }
}


