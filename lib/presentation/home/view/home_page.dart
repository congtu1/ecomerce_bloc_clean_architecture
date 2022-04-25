import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecomerce_ui/config/theme_constants.dart';
import 'package:flutter_ecomerce_ui/config/cus_size.dart';
import 'package:flutter_ecomerce_ui/presentation/Widgets/appbar.dart';
import 'package:flutter_ecomerce_ui/presentation/home/bloc/home_bloc.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bloc/home_event.dart';
import '../utils.dart';
import '../widgets/home_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: HomePage());

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  List<String> listArrival = ["All", "Apparel", "Dress", "Tshirt", "Bag"];
  List<String> listBrand = [
    "assets/images/Boss.png",
    "assets/images/Burberry.png",
    "assets/images/Catier.png",
    "assets/images/Gucci.png",
    "assets/images/Prada.png",
    "assets/images/Tiffany & Co.png",
  ];
  List<String> listTrending = [
    '2021',
    'spring',
    'collection',
    'fall',
    'dress',
    'autumncollection',
    'openfashion'
  ];

  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: listArrival.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CustomSize().init(context);
    return Scaffold(
      appBar: AppBarEx(),
      body: BlocProvider(
        create: ((context) => HomeBloc()..add(HomeLoadEvent())),
        child: SafeArea(
          child: ListView(
            children: [
              const HomeBanner(),
              const SizedBox(
                height: 27,
              ),
              HomeArrival(
                  tabController: _tabController, listArrival: listArrival),
              const SizedBox(
                height: 22,
              ),
              HomeBrand(listBrand: listBrand),
              const HomeCollections(),
              const HomeVideo(),
              const SizedBox(
                height: 49,
              ),
              // const HomeJustForYou(),
              // const SizedBox(
              //   height: 20,
              // ),
              // HomeTrending(listTrending: listTrending),
              // SizedBox(
              //   height: 20,
              //   child: Column(
              //     children: [],
              //   ),
              // ),
              DecoratedBox(
                decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: SvgPicture.asset("assets/images/Logo.svg"),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(47.38),
                          vertical: 10),
                      child: Text(
                        "Making a luxurious lifestyle accessible for a generous group of women is our daily drive.",
                        style: GoogleFonts.tenorSans(
                            fontSize: 16, color: const Color(0xFF727272)),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SvgPicture.asset("assets/images/divider.svg"),
                    Container(
                      height: 233,
                      padding: const EdgeInsets.all(20),
                      child: GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: 1.5,
                        physics: const NeverScrollableScrollPhysics(),
                        children: List.generate(
                            listIntroduction.length,
                            (index) => Column(
                                  children: [
                                    Image.asset(listIntroduction[index].image),
                                    Text(
                                      listIntroduction[index].description,
                                      textAlign: TextAlign.center,
                                      style: bodyMediumStyle,
                                    )
                                  ],
                                )),
                      ),
                    ),
                    SvgPicture.asset("assets/images/end_intro.svg"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
