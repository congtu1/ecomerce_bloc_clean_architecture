import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../config/cus_size.dart';


class HomeBrand extends StatelessWidget {
  const HomeBrand({
    Key? key,
    required this.listBrand,
  }) : super(key: key);

  final List<String> listBrand;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      width: getProportionateScreenWidth(375),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: [
          SvgPicture.asset("assets/images/divider.svg"),
          Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                physics: NeverScrollableScrollPhysics(),
                childAspectRatio: 2,
                children: List.generate(listBrand.length,
                        (index) => Image.asset(listBrand[index])),
              )),
          SvgPicture.asset("assets/images/divider.svg"),
          const SizedBox(
            height: 27,
          ),
        ],
      ),
    );
  }
}