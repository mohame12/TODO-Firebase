import 'package:flutter/material.dart';
import 'package:todo2/core/utils/my_style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo2/core/widgets/custom_tff.dart';
import '../../../../core/utils/my_color.dart';
class UpdateScreen extends StatelessWidget {
   UpdateScreen({super.key});
  static const String id='UpdateScreen';
  TextEditingController updateTitle=TextEditingController();
  TextEditingController updateDiscribe=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.taskUpdate,style: MyStyle.textStyle22,),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
                width: double.infinity,
                color: blueColor,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.symmetric(vertical: 50,horizontal: 20),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height*0.7,
                  child: Card(
                    child:Padding(
                      padding:  EdgeInsetsDirectional.only(start:40 ,end:40 ,top:22 ,bottom:MediaQuery.of(context).viewInsets.bottom ),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height*0.4,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            Text(AppLocalizations.of(context)!.editTask,style: MyStyle.textStyle18,),
                            SizedBox(height: 50,),
                            CustomTff(textEditingController: updateTitle, obSecureText: false,label: AppLocalizations.of(context)!.title, borderColor: greyColor,),
                            SizedBox(height: 27,),
                            CustomTff(textEditingController:updateDiscribe, obSecureText: false,label: AppLocalizations.of(context)!.discribtion, borderColor: greyColor,),
                            SizedBox(height: 26,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(AppLocalizations.of(context)!.selectTime,style: MyStyle.textStyle20,),
                              ],
                            ),
                            SizedBox(height: 30,),
                            GestureDetector(
                                onTap: ()
                                {
                                  showDatePicker(
                                      initialDate: DateTime.now(),
                                      context: context, firstDate: DateTime.now().subtract(Duration(days: 365)), lastDate:DateTime.now().add(Duration(days: 1000)));
                                },
                                child: Text('27-6-2021',style: MyStyle.textStyle18.copyWith(color: greyColor),)),
                            SizedBox(height: 20,),
                           Spacer(),
                           ElevatedButton(
                             style: ElevatedButton.styleFrom(backgroundColor:Colors.blue),
                               onPressed: (){},
                               child:Padding(
                                 padding: const EdgeInsets.all(12),
                                 child: Text(AppLocalizations.of(context)!.saveChanges,style: MyStyle.textStyle18.copyWith(color: whiteColor),),
                               ) ),
                            Spacer(),
                          ],
                        ),
                      ),
                    )

                  ),
                ),
              ),
            ],
          ),


        ],
      ),
    );
  }
}
