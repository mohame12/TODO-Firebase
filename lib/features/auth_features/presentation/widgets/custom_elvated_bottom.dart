import 'package:flutter/material.dart';

import '../../../../core/utils/my_color.dart';

class CustomElevated extends StatelessWidget {
  const CustomElevated({
    super.key, required this.onPressed, required this.child,
  });
  final void Function()? onPressed;
  final Widget? child;
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
        child: child,
      )),
    );
  }
}