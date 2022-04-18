import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecomerce_ui/data_layer/models/models.dart';
import 'package:flutter_ecomerce_ui/presentation/home/bloc/home_state.dart';
import 'package:flutter_ecomerce_ui/presentation/home/utils.dart';

import '../../../config/cus_size.dart';
import 'home_product_item.dart';
import 'home_title_text.dart';

class HomeJustForYou extends StatelessWidget {
  const HomeJustForYou({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      builder: (context, state) {
        late Widget widget = Container();
        if (state is HomeLoadedState) {
          List<ProductModel> list = state.homeResponse.homeArrival;
          widget = Column(
            children: [
              const TitleText(
                text: 'Just For You',
              ),
              SizedBox(
                height: 450,
                child: ListView.builder(
                  itemCount: listProduct.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: getProportionateScreenWidth(255),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: HomeProductItem(
                          product: list[index],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          );
        }
        if (state is HomeLoadingState) {
          widget = const CircularProgressIndicator();
        }
        if (state is HomeLoadFailure) {
          return const Placeholder();
        }
        return widget;
      },
    );
  }
}