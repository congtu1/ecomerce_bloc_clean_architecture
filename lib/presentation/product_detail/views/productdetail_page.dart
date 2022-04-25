import 'package:flutter/material.dart';
import 'package:flutter_ecomerce_ui/common/injector/injector.dart';
import 'package:flutter_ecomerce_ui/config/theme_constants.dart';
import 'package:flutter_ecomerce_ui/config/cus_size.dart';
import 'package:flutter_ecomerce_ui/data_layer/models/models.dart';
import 'package:flutter_ecomerce_ui/domain/usescases/cart_usecase.dart';
import 'package:flutter_ecomerce_ui/presentation/Widgets/appbar.dart';
import 'package:flutter_ecomerce_ui/presentation/app/bloc/app_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: ProductDetailPage());

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final PageController _pageController = PageController(initialPage: 0);
  ProductModel product = getIt.get<AppBloc>().state.parameter;

  @override
  void initState() {
    // Timer.periodic(const Duration(seconds: 5), (Timer timer) {
    //   if (_currentPage < 2) {
    //     _currentPage++;
    //   } else {
    //     _currentPage = 0;
    //   }
    //
    //   _pageController.animateToPage(
    //     _currentPage,
    //     duration: const Duration(milliseconds: 300),
    //     curve: Curves.easeIn,
    //   );
    // });
    super.initState();
  }

  @override
  void dispose() {
    // _pageController.dispose();
    super.dispose();
  }

  // _onPageChanged(int index) {
  //   setState(() {
  //     _currentPage = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    CustomSize().init(context);
    return Scaffold(
      appBar: AppBarEx(),
      body: ListView(
        children: [
          Container(
            height: 500,
            width: getProportionateScreenWidth(375),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Stack(
                    children: [buildPageView()],
                  ),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      3,
                      (index) => Transform.rotate(
                          angle: 0.9,
                          child: Container(
                            width: 10,
                            height: 10,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.grey.withOpacity(0.2)),
                            ),
                          )),
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    "M O H A N",
                    style: titleStyle,
                  ),
                ),
                Text(
                  product.name,
                  style: bodyLargeStyle,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    "\$120",
                    style: bodyLargeStyle,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "Color",
                      style: bodyMediumStyle,
                    ),
                    Row(
                      children: List.generate(
                        3,
                            (index) => Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 20),
                          padding: const EdgeInsets.all(2),
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, border: Border.all()),
                          child: Center(
                            child: Container(
                              height: 18,
                              width: 18,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.orange),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "Size",
                      style: bodyMediumStyle,
                    ),
                    Row(
                      children: List.generate(
                        3,
                        (index) => Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 20),
                          padding: const EdgeInsets.all(2),
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, border: Border.all()),
                          child: Center(
                              child: Text(
                            "M",
                            style: bodyMediumStyle,
                          )),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "MATERIALS",
                  style: titleStyle,
                ),
                Text(
                  "We work with monitoring programmes to ensure compliance with safety, health and quality standards for our products. ",
                  style: bodyMediumStyle,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Care",
                  style: titleStyle,
                ),
                Text(
                  "To keep your jackets and coats clean, you only need to freshen them up and go over them with a cloth or a clothes brush. If you need to dry clean a garment, look for a dry cleaner that uses technologies that are respectful of the environment.",
                  style: bodyMediumStyle,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                4,
                    (index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.ac_unit,
                        color: Colors.grey.withOpacity(0.5),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          "Do not you bleach",
                          style: bodyLargeStyle,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "CARE",
                  style: titleStyle,
                ),
                Column(
                  children: List.generate(
                    3,
                    (index) => ExpansionTile(
                      // tilePadding: EdgeInsets.symmetric(horizontal: 10),
                      title: Row(
                        children: [
                          const Icon(Icons.car_rental),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              "Free Flat Rate Shipping",
                              style: bodyLargeStyle,
                            ),
                          ),
                        ],
                      ),
                      children: [
                        Text(
                          "Estimated to be delivered on 09/11/2021 - 12/11/2021.",
                          style: bodyMediumStyle,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Text(
                "YOU MAY ALSO LIKE",
                style: titleStyle,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: SvgPicture.asset("assets/images/divider.svg"),
              ),
              // SizedBox(
              //   width: getProportionateScreenWidth(375),
              //   height: 573,
              //   child: GridView.count(
              //     primary: false,
              //     physics: const NeverScrollableScrollPhysics(),
              //     childAspectRatio: 1 / 1.5,
              //     crossAxisCount: 2,
              //     mainAxisSpacing: 10,
              //     crossAxisSpacing: 5,
              //     children: List.generate(
              //       4,
              //       (index) => HomeProductItem(product: listProduct[index]),
              //     ),
              //   ),
              // )
            ],
          ),
          const SizedBox(
            height: 100,
          )
        ],
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          getIt.get<CartUseCase>().addToCart(product.id);
        },
        child: Container(
          height: 50,
          width: getProportionateScreenWidth(350),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: const BoxDecoration(color: Colors.black),
          child: Row(
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  Text(
                    "ADD TO BASKET",
                    style: bodyLargeStyle,
                  ),
                ],
              ),
              const Spacer(),
              const Icon(
                Icons.favorite_border,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }

  PageView buildPageView() {
    return PageView.builder(
      itemCount: 3,
      // onPageChanged: _onPageChanged,
      controller: _pageController,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Image.asset(
          "assets/images/product_detail.png",
          fit: BoxFit.fill,
        );
      },
    );
  }
}
