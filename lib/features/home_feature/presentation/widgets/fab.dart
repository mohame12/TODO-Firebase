import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todo2/core/utils/my_style.dart';
import 'package:todo2/core/widgets/custom_tff.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../core/utils/my_color.dart';

class FAB extends StatelessWidget {
   FAB({
    super.key,
  });

  TextEditingController title=TextEditingController();
  TextEditingController discribe=TextEditingController();
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
          builder: (context) =>
              ModalBottomSheet(title: title, discribe: discribe, head: AppLocalizations.of(context)!.addNewTask,),
        );
      },
      child: const Icon(
        FontAwesomeIcons.plus,
        color: whiteColor,
      ),
    );
  }
}

class ModalBottomSheet extends StatelessWidget {
  const ModalBottomSheet({
    super.key,
    required this.title,
    required this.discribe, required this.head,
  });
  final String head;
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
        Text(head,style: MyStyle.textStyle18,),
            SizedBox(height: 28,),
            CustomTff(textEditingController: title, obSecureText: false,label: AppLocalizations.of(context)!.title, borderColor: greyColor,),
            SizedBox(height: 27,),
            CustomTff(textEditingController: discribe, obSecureText: false,label: AppLocalizations.of(context)!.discribtion, borderColor: greyColor,),
            SizedBox(height: 26,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppLocalizations.of(context)!.selectTime,style: MyStyle.textStyle20,),
              ],
            ),
            GestureDetector(
                onTap: ()
                {
                  showDatePicker(
                      initialDate: DateTime.now(),
                      context: context, firstDate: DateTime.now().subtract(Duration(days: 365)), lastDate:DateTime.now().add(Duration(days: 1000)));
                },
                child: Text('27-6-2021',style: MyStyle.textStyle18.copyWith(color: greyColor),)),
            SizedBox(height: 20,),
            FloatingActionButton(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
                side: BorderSide(color: whiteColor,width: 2)
              ),
              onPressed: (){
              },
              child: const Icon(FontAwesomeIcons.check,color: whiteColor,size: 30,),)
                    ],
                  ),
      ),
    );
  }
}
