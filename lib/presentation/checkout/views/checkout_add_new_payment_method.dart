import 'package:flutter/material.dart';
import 'package:flutter_ecomerce_ui/presentation/Widgets/appbar.dart';

import 'package:flutter_ecomerce_ui/presentation/checkout/widgets/checkout_default_button.dart';
import 'package:flutter_ecomerce_ui/presentation/checkout/widgets/checkout_header.dart';
import 'package:flutter_ecomerce_ui/presentation/checkout/widgets/checkout_payment_card.dart';
import 'package:flutter_ecomerce_ui/presentation/checkout/widgets/checkout_payment_success_dialog.dart';
import '../../../config/theme_constants.dart';
import '../../../config/cus_size.dart';
import 'checkout_addnew_address.dart';

class CheckoutAddNewPaymentMethod extends StatefulWidget {
  const CheckoutAddNewPaymentMethod({
    Key? key,
  }) : super(key: key);

  @override
  State<CheckoutAddNewPaymentMethod> createState() => _CheckoutAddNewPaymentMethodState();
}

class _CheckoutAddNewPaymentMethodState extends State<CheckoutAddNewPaymentMethod> {

  late PageController pageController;
  double viewportFraction = 0.8;
  int _currentPage = 1;

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  void initState() {
    pageController = PageController(initialPage: 1,viewportFraction: 0.9);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    CustomSize().init(context);
    return Scaffold(
      appBar: AppBarEx(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: 630,
            child: Column(
              children: [
                const CheckoutHeader(
                  title: "PAYMENT METHOD",
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  height: 200,
                  width: getProportionateScreenWidth(375),
                  child: Column(
                    children: [
                      Expanded(
                        child: PageView.builder(
                          itemCount: 3,
                          onPageChanged: _onPageChanged,
                          controller: pageController,
                          scrollDirection: Axis.horizontal,

                          itemBuilder: (context, index) {
                            return CheckoutPaymentCard();
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                            3,
                                (index) => Transform.rotate(
                              angle: 0.9,
                              child: Container(
                                width: 5,
                                height: 5,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey.withOpacity(0.2)),
                                    color: _currentPage == index
                                        ? Colors.grey.withOpacity(0.2)
                                        : null),
                              ),
                            )),
                      )
                    ],
                  )
                ),
                Expanded(
                  child: Column(
                    children: [
                      const CheckoutTextFormInput(
                        hintText: "Name On Card",
                      ),
                      const CheckoutTextFormInput(
                        hintText: "Card Number",
                      ),
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
                                    hintText: "Exp Month",
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
                                    hintText: "Exp Date",
                                    hintStyle: bodyLargeStyle,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const CheckoutTextFormInput(
                        hintText: "CVV",
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => showPaymentSuccessDialog(context),
                  child: const CheckoutDefaultButton(
                    icon: Icons.location_on,
                    text: "ADD NOW",
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


