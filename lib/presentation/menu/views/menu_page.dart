import 'package:flutter/material.dart';
import 'package:flutter_ecomerce_ui/config/theme_constants.dart';
import 'package:flutter_ecomerce_ui/config/cus_size.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../untils.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: MenuPage());

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CustomSize().init(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.grey,
          ),
          onPressed: () {},
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            TabBar(
              controller: tabController,
              tabs: [
                Tab(
                  child: Text(
                    "WOMEN",
                    style: titleStyle,
                  ),
                ),
                Tab(
                  child: Text("MAN", style: titleStyle),
                ),
                Tab(
                  child: Text("KIDS", style: titleStyle),
                )
              ],
            ),
            SizedBox(
              width: getProportionateScreenWidth(375),
              height: 400,
              child: TabBarView(
                controller: tabController,
                children: List.generate(
                    3,
                    (index) => ListView(
                          children: List.generate(
                              listMenu.length,
                              (index) => ExpansionTile(
                                    title: Text(listMenu[index].title,style: bodyMediumStyle,),
                                    children: List.generate(
                                        listMenu[index].menu_item.length,
                                        (id) {
                                          String text = listMenu[index].menu_item[id];
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                                  child: Text(text,style: bodyMediumStyle,textAlign: TextAlign.left,),
                                                )
                                              ],
                                            ),
                                          );
                                        }),
                                  )),
                        )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.phone,
                        size: 40,
                      ),
                      Text(
                        "(786) 713-8616",
                        style: bodyLargeStyle,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 40,
                      ),
                      Text(
                        "Store Locator",
                        style: bodyLargeStyle,
                      )
                    ],
                  )
                ],
              ),
            ),
            SvgPicture.asset("assets/images/divider.svg")

          ],
        ),
      ),
    );
  }
}
