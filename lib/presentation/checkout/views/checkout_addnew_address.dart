import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecomerce_ui/presentation/Widgets/appbar.dart';
import 'package:flutter_ecomerce_ui/presentation/checkout/widgets/checkout_default_button.dart';
import 'package:flutter_ecomerce_ui/presentation/checkout/widgets/checkout_header.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/theme_constants.dart';
import '../../../config/cus_size.dart';



class CheckoutAddNewAddress extends StatelessWidget {
  const CheckoutAddNewAddress({
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
              title: "ADD SHIPPING ADDRESS",
            ),
            Expanded(
              child: Column(
                children: [
                  Container(
                    height: 50,
                    width: getProportionateScreenWidth(375),
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "First name",
                                hintStyle: bodyLargeStyle,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Last name",
                                hintStyle: bodyLargeStyle,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const CheckoutTextFormInput(hintText: "Address",),
                  const CheckoutTextFormInput(hintText: "City",),
                  Container(
                    height: 50,
                    width: getProportionateScreenWidth(375),
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "State",
                                hintStyle: bodyLargeStyle,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "ZIP code",
                                hintStyle: bodyLargeStyle,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const CheckoutTextFormInput(hintText: "Phone number",),

                ],
              ),
            ),
            CheckoutDefaultButton(
              icon: Icons.location_on,
              text: "ADD NOW",
            )
          ],
        ),
      ),
    );
  }
}

class CheckoutTextFormInput extends StatelessWidget {
  const CheckoutTextFormInput({
    Key? key,required this.hintText
  }) : super(key: key);
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: getProportionateScreenWidth(375),
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: bodyLargeStyle,
        ),
      ),
    );
  }
}
