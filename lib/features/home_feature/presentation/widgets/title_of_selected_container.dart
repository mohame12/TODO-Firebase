import 'package:flutter/material.dart';

import '../../../../core/utils/my_style.dart';

class TitleOfSelectedContainer extends StatelessWidget {
  const TitleOfSelectedContainer({
    super.key, required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top:25,start: 38),
      child: Text(title,style: MyStyle.textStyle14,),
    );
  }
}