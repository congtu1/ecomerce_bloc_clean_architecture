import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecomerce_ui/data_layer/models/models.dart';
import 'package:flutter_ecomerce_ui/presentation/home/bloc/home_bloc.dart';
import 'package:flutter_ecomerce_ui/presentation/home/bloc/home_state.dart';
import 'package:flutter_svg/svg.dart';
import '../../../config/theme_constants.dart';
import '../../../config/cus_size.dart';
import 'home_product_item.dart';
import 'home_title_text.dart';

class HomeArrival extends StatelessWidget {
  const HomeArrival({
    Key? key,
    required TabController tabController,
    required this.listArrival,
  }) : _tabController = tabController, super(key: key);

  final TabController _tabController;
  final List<String> listArrival;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        late Widget widget = Container();
        if (state is HomeLoadedState) {
          List<ProductModel> list = state.homeResponse.homeArrival;
          if (list.isEmpty) {
            widget = const Center(
              child: Text("No data"),
            );
          } else {
            widget = SizedBox(
              height: 736,
              width: getProportionateScreenWidth(375),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const TitleText(text: "NEW ARRIVAL"),
                    SvgPicture.asset("assets/images/divider.svg"),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TabBar(
                          indicatorColor: Colors.transparent,
                          controller: _tabController,
                          labelPadding: EdgeInsets.zero,
                          padding: EdgeInsets.zero,
                          tabs: List.generate(
                              listArrival.length,
                              (index) => Tab(
                                      child: Text(
                                    listArrival[index],
                                    style: bodyMediumStyle,
                                  )))),
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(375),
                      height: 573,
                      child: TabBarView(
                        controller: _tabController,
                        children: List.generate(listArrival.length, (index) {
                          return GridView.count(
                            primary: false,
                            physics: const NeverScrollableScrollPhysics(),
                            childAspectRatio: 1 / 1.5,
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 5,
                            children: List.generate(
                                list.length,
                                (index) =>
                                    HomeProductItem(product: list[index])),
                          );
                        }),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Explore More",
                            style: titleStyle,
                          ),
                          const Icon(Icons.arrow_forward_sharp)
                        ],
                      ),
                    )
                  ]),
            );
          }
        }
        if (state is HomeLoadingState) {
          widget = const CircularProgressIndicator();
        }
        if (state is HomeLoadFailure) {
          widget = const Placeholder();
        }
        return widget;
      },
    );
  }
}