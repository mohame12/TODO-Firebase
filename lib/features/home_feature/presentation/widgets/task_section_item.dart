import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todo2/features/update_feature/presentation/views/update_feature.dart';
import '../../../../core/utils/my_color.dart';
import '../../../../core/utils/my_style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class TaskSectionItem extends StatelessWidget {
  const TaskSectionItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height*0.18,
      width: MediaQuery.of(context).size.width,

      child: Slidable(
        startActionPane: ActionPane(
            motion: const Padding(
              padding: EdgeInsetsDirectional.symmetric(vertical: 10),
              child: ClipRRect(
                  borderRadius: BorderRadiusDirectional.only(topStart: Radius.circular(10),bottomStart: Radius.circular(10)),
                  child: StretchMotion()),
            ),
            children: [
          SlidableAction(
            onPressed: (val){
              Navigator.pushNamed(context, UpdateScreen.id);
            },
            padding: EdgeInsets.zero,
            backgroundColor: const Color(0xFF21B7CA),
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: AppLocalizations.of(context)!.edit,
          ),
        ]),
        endActionPane: ActionPane(
            motion: Padding(
              padding: const EdgeInsetsDirectional.symmetric(vertical: 10),
              child: ClipRRect(
                  borderRadius: BorderRadiusDirectional.only(topEnd:Radius.circular(10) ,bottomEnd:Radius.circular(10) ),
                  child: StretchMotion()),
            ),
            children: [
          SlidableAction(
            onPressed: (val){
            },
            padding: EdgeInsets.zero,
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: AppLocalizations.of(context)!.delete,
          ),
        ]),
        child: Card(
          margin: EdgeInsets.zero,
          child: Padding(
            padding: const EdgeInsets.all(27),
            child: Row(
              children: [
                Container(
                  height: double.infinity,
                  width: 4,
                  color: blueColor,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Play basket ball',style: MyStyle.textStyle18.copyWith(color: blueColor),),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          SvgPicture.asset('assets/images/Discovery.svg'),
                          const SizedBox(width: 3,),
                          const Text('10:30 AM',style: MyStyle.textStyle12,)
                        ],
                      )
                    ],
                  ),
                ),
                const Spacer(flex: 1,),
                ElevatedButton(onPressed: (){

                },
                  style: ElevatedButton.styleFrom(backgroundColor: blueColor),
                  child:const Icon(FontAwesomeIcons.check,color: whiteColor,),)
              ],
            ),
          ),

        ),
      ),
    );
  }
}