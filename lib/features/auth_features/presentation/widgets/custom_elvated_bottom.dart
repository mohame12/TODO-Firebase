import 'package:flutter/material.dart';

import '../../../../core/utils/my_color.dart';
import '../../../../core/utils/my_style.dart';

class CustomElevated extends StatelessWidget {
  const CustomElevated({
    super.key, required this.text, required this.onPressed,
  });
  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:double.infinity,
      height: 50,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)
              ),
              backgroundColor: blueColor
          ),
          onPressed: onPressed, child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
        child: Row(
          children: [
            Text(text,style: MyStyle.textStyle14.copyWith(color: whiteColor),),
            const Spacer(),
            const Icon(Icons.arrow_forward,color: whiteColor,)
          ],
        ),
      )),
    );
  }
}