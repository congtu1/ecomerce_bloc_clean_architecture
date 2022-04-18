import 'package:flutter/material.dart';

import '../../../config/theme_constants.dart';
import 'home_title_text.dart';

class HomeTrending extends StatelessWidget {
  const HomeTrending({
    Key? key,
    required this.listTrending,
  }) : super(key: key);

  final List<String> listTrending;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitleText(text: "@ T R E N D I N G",),
        Wrap(
          children: List.generate(
              listTrending.length,
                  (index) => Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey.withOpacity(0.2)),
                    child: Text(
                      "#" + listTrending[index],
                      style: bodySmallStyle,
                    ),
                  )),
        )
      ],
    );
  }
}