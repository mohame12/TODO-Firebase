import 'package:flutter/material.dart';

import '../../../../core/utils/my_color.dart';
import '../../../../core/utils/my_style.dart';

class SelectedContainer extends StatelessWidget {
  const SelectedContainer({
    super.key, required this.contain,
  });
  final String contain;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 17,start: 40,end: 40),
      child: Container(
        height: MediaQuery.of(context).size.height*0.061,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: whiteColor,
            border: Border.all(color: blueColor)
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Text(contain,style: MyStyle.textStyle14.copyWith(fontWeight: FontWeight.normal,color: blueColor),),
              Spacer(),
              Icon(Icons.keyboard_arrow_down,color: blueColor,)
            ],
          ),
        ),
      ),
    );
  }
}