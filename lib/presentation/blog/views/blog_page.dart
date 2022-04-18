import 'package:flutter/material.dart';
import 'package:flutter_ecomerce_ui/config/theme_constants.dart';
import 'package:flutter_ecomerce_ui/presentation/Widgets/appbar.dart';
import 'package:flutter_ecomerce_ui/presentation/blog/widgets/blog_hashtag.dart';
import 'package:flutter_ecomerce_ui/presentation/blog/widgets/blog_title.dart';

import '../../../config/cus_size.dart';
import '../utils.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({Key? key}) : super(key: key);

  static const List<String> listHashTag = [
    "Fashion",
    "Promo",
    "Policy",
    "Lookbook",
    "Hello",
    "Nakamura",
    "Watashabi"
  ];

  @override
  Widget build(BuildContext context) {
    CustomSize().init(context);
    return Scaffold(
      appBar: AppBarEx(),
      body: SafeArea(
        child: ListView(
          children: [
            const BlogTitle(),
            const BlogHashTag(listHashTag: listHashTag),
            Column(
              children: List.generate(
                  listArticle.length,
                  (index1) => Container(
                        height: 231.67,
                        width: getProportionateScreenWidth(360),
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          children: [
                            Expanded(
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        listArticle[index1].image.toString()),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      bottom: 0,
                                      child: Container(
                                        height: 70,
                                        width: getProportionateScreenWidth(370),
                                        decoration: const BoxDecoration(
                                            gradient: LinearGradient(
                                                begin: Alignment.bottomCenter,
                                                end: Alignment.topCenter,
                                                colors: [
                                              Colors.black,
                                              Colors.transparent
                                            ])),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 20,
                                        left: 10,
                                        child: SizedBox(
                                          width: getProportionateScreenWidth(360),
                                          child: Text(
                                            listArticle[index1].title,
                                            style: bodyLargeStyle,
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Wrap(
                                  children: List.generate(
                                      listArticle[index1].hashtag.length,
                                      (index2) {
                                    var article =
                                        listArticle[index1].hashtag[index2];
                                    return Container(
                                      padding: const EdgeInsets.all(8),
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 4),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          border: Border.all(
                                              color: Colors.grey
                                                  .withOpacity(0.3))),
                                      child: Center(
                                        child: Text(
                                          "#" + article,
                                          style: bodySmallStyle,
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                                Text(
                                  listArticle[index1].posted_at,style: bodySmallStyle,
                                )
                              ],
                            )
                          ],
                        ),
                      )),
            ),
            SizedBox(
              width: getProportionateScreenWidth(375),
              height: 100,
              child: Center(
                child: Container(
                  width: getProportionateScreenWidth(211),
                  height: 48,
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 0.5, color: Colors.grey.withOpacity(0.2)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("LOAD MORE"),
                      Icon(
                        Icons.add,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
