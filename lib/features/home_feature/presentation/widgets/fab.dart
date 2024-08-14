import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/utils/my_color.dart';
import 'modal_bottom_sheet.dart';

class FAB extends StatelessWidget {
  const FAB({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: blueColor,
      shape: RoundedRectangleBorder(
          side: const BorderSide(color: whiteColor, width: 2),
          borderRadius: BorderRadius.circular(30)),
      onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: whiteColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          context: context,
          builder: (context) => const ModalBottomSheet()
        );
      },
      child: const Icon(
        FontAwesomeIcons.plus,
        color: whiteColor,
      ),
    );
  }
}


