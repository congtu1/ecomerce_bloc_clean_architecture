import 'package:flutter/material.dart';
import 'package:flutter_ecomerce_ui/presentation/Widgets/appbar.dart';

import 'package:flutter_ecomerce_ui/presentation/Widgets/checkout_default_button.dart';
import 'package:flutter_ecomerce_ui/presentation/checkout/widgets/checkout_header.dart';
import 'package:flutter_ecomerce_ui/presentation/checkout/widgets/checkout_total_money.dart';

import '../../../config/theme_constants.dart';
import '../../../config/cus_size.dart';

class CheckoutInputInformation extends StatelessWidget {
  const CheckoutInputInformation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CustomSize().init(context);
    return Scaffold(
      appBar: AppBarEx(),
      body: SafeArea(
        child: Column(
          children: [
            const CheckoutHeader(
              title: "C H E C K O U T",
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "SHIPPING ADDRESS",
                      style: bodyLargeStyle,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Iris Wastson",
                            style: titleStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                  child: Text(
                                "606-3727 Ullamcorper. Street Roseville NH 11523",
                                style: bodyLargeStyle,
                              )),
                              const Icon(
                                Icons.arrow_forward_ios,
                              ),
                            ],
                          ),
                          Text(
                            "(786) 713-8616",
                            style: bodyLargeStyle,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 48,
                      width: getProportionateScreenWidth(342),
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20)
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Add shipping address",style: bodyLargeStyle,
                            ),
                            const Icon(Icons.add,size: 25,color: Colors.grey,)
                          ],
                        ),
                      ),
                    ),
                    Text(
                      "SHIPPING METHOD",
                      style: bodyLargeStyle,
                    ),
                    Container(
                      height: 48,
                      width: getProportionateScreenWidth(342),
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20)
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Pick at store",
                              style: bodyLargeStyle,
                            ),
                            const Spacer(),
                            Text(
                              "FREE",
                              style: bodyLargeStyle,
                            ),
                            const Icon(
                              Icons.arrow_drop_down,
                              size: 25,
                              color: Colors.grey,
                            )
                          ],
                        ),
                      ),
                    ),
                    Text(
                      "PAYMENT METHOD",
                      style: bodyLargeStyle,
                    ),
                    Container(
                      height: 48,
                      width: getProportionateScreenWidth(342),
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20)
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Select payment medthod",style: bodyLargeStyle,
                            ),
                            const Icon(
                              Icons.arrow_drop_down,
                              size: 25,
                              color: Colors.grey,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const CheckoutTotalMoney(),
            const BottomDefaultButton(
              icon: Icons.shopping_bag,
              text: "CHECKOUT",
            )
          ],
        ),
      ),
    );
  }
}
