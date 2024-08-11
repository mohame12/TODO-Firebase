import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/utils/my_color.dart';
import '../../../../core/utils/my_style.dart';
import '../../../../core/widgets/custom_tff.dart';

class ModalBottomSheet extends StatelessWidget {
  const ModalBottomSheet({
    super.key,
    required this.title,
    required this.discribe,
  });

  final TextEditingController title;
  final TextEditingController discribe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsetsDirectional.only(start:40 ,end:40 ,top:22 ,bottom:MediaQuery.of(context).viewInsets.bottom ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height*0.4,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            const Text('Add new Task',style: MyStyle.textStyle18,),
            const SizedBox(height: 28,),
            CustomTff(textEditingController: title, obSecureText: false,label: 'Title', borderColor: greyColor,),
            const SizedBox(height: 27,),
            CustomTff(textEditingController: discribe, obSecureText: false,label: 'Discribtion', borderColor: greyColor,),
            const SizedBox(height: 26,),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Select time',style: MyStyle.textStyle20,),
              ],
            ),
            Text('27-6-2021',style: MyStyle.textStyle18.copyWith(color: greyColor),),
            const SizedBox(height: 20,),
            FloatingActionButton(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: const BorderSide(color: whiteColor,width: 2)
              ),
              onPressed: (){},
              child: const Icon(FontAwesomeIcons.check,color: whiteColor,size: 30,),)
          ],
        ),
      ),
    );
  }
}