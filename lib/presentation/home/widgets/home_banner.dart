import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecomerce_ui/data_layer/models/banner_model.dart';
import 'package:flutter_ecomerce_ui/presentation/home/bloc/home_bloc.dart';
import 'package:flutter_ecomerce_ui/presentation/home/bloc/home_state.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/cus_size.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      late Widget widget = Container();
      if (state is HomeLoadedState) {
        List<BannerModel> banner = state.homeResponse.homeBanner;
        widget = Container(
          height: 550,
          width: getProportionateScreenWidth(375),
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    'assets/images/banner.png',
                  ))),
          child: Column(
            children: [
              Expanded(
                  child: PageView.builder(
                itemCount: banner.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Positioned(
                        top: getProportionateScreenWidth(231.44),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(36.71)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                banner[index].title,
                                style: GoogleFonts.tenorSans(fontSize: 36),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        getProportionateScreenWidth(17.53)),
                                child: Text("FASHION",
                                    style: GoogleFonts.tenorSans(fontSize: 36)),
                              ),
                              Text("&ACCESSORIES",
                                  style: GoogleFonts.tenorSans(fontSize: 36)),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 40,
                        child: Container(
                          width: getProportionateScreenWidth(253),
                          height: 40,
                          margin: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(61)),
                          decoration: BoxDecoration(
                              color: Color(0xFF000000).withOpacity(0.4),
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                              child: Text(
                            "Explore Collection",
                            style: GoogleFonts.tenorSans(
                                color: Colors.white, fontSize: 18),
                          )),
                        ),
                      )
                    ],
                  );
                },
              ))
            ],
          ),
        );
      }
      if (state is HomeLoadingState) {
        widget = const CircularProgressIndicator();
      }
      if (state is HomeLoadFailure) {
        widget = const Placeholder();
      }
      return widget;
    });
  }
}
