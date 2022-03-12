import 'package:flutter/material.dart';

import '../../../config/theme_constants.dart';

class BlogHashTag extends StatelessWidget {
  const BlogHashTag({
    Key? key,
    required this.listHashTag,
  }) : super(key: key);

  final List<String> listHashTag;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(listHashTag.length, (index) => BlogHashTagItem(listHashTag: listHashTag,index: index,)),
      ),
    );
  }
}

class BlogHashTagItem extends StatelessWidget {
  const BlogHashTagItem({
    Key? key,
    required this.listHashTag,
    required this.index
  }) : super(key: key);

  final List<String> listHashTag;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20)
      ),
      child: Center(
        child: Text(listHashTag[index],style: bodyMediumStyle,),
      ),
    );
  }
}