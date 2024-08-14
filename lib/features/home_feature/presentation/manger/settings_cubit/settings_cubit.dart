import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:todo2/core/shared_pref/shared_pref.dart';
import 'package:todo2/core/utils/my_color.dart';

import '../../../../../core/utils/my_style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());

  bool isAr=false;
  bool isLight=false;

  lastTheme()
  {
    isLight=UserDataFromStorage.themeIsDarkMode;
    emit(SettingsTheme());
  }


  lastLanguage()
  {
    isAr=UserDataFromStorage.Language;
    emit(SettingsLanguage(isAr: isAr));
  }


  onPressedLanguage({required BuildContext context})
  {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
      context: context, builder: (context) => Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: ()
              {
                isAr=true;
                emit(SettingsLanguage(isAr: isAr));
                UserDataFromStorage.setLanguage(isAr);
                Navigator.pop(context);
              },
              child: Row(
                children: [
                  Text(AppLocalizations.of(context)!.arabic,style: MyStyle.textStyle20.copyWith(color:isAr?blueColor:greyColor ),),//ar
                  Spacer(),
                  Visibility(
                      visible: isAr,
                      child: Icon(Icons.check,color:isAr?blueColor:greyColor)),
                ],
              ),
            ),


            SizedBox(height: 10,),


            GestureDetector(
              onTap: ()
              {
                isAr=false;
                emit(SettingsLanguage(isAr: isAr));
                UserDataFromStorage.setLanguage(isAr);
                Navigator.pop(context);
              },
              child: Row(
                children: [
                  Text(AppLocalizations.of(context)!.english,style: MyStyle.textStyle20.copyWith(color:!isAr?blueColor:greyColor),),//en
                  Spacer(),
                  Visibility(
                      visible: !isAr,
                      child: Icon(Icons.check,color:!isAr?blueColor:greyColor)),
                ],
              ),
            ),
          ],),
      ),
    ),);
  }



  onPressedMode({required BuildContext context})
  {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),),
      context: context, builder: (context) =>
        Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [


                GestureDetector(
                  onTap: (){
                    isLight=true;
                    UserDataFromStorage.setThemeIsDarkMode(isLight);
                    emit(SettingsTheme());
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: [
                      Text(AppLocalizations.of(context)!.light, style: MyStyle.textStyle20.copyWith(color:isLight?blueColor:greyColor),),//light
                      Spacer(),
                      Visibility(
                          visible: isLight,
                          child: Icon(Icons.check,color:isLight?blueColor:blackColor)),
                    ],
                  ),
                ),


                SizedBox(height: 10,),



                GestureDetector(
                  onTap: ()
                  {

                    isLight=false;
                    UserDataFromStorage.setThemeIsDarkMode(isLight);
                    emit(SettingsTheme());
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: [
                      Text(AppLocalizations.of(context)!.dark, style: MyStyle.textStyle20.copyWith(color:!isLight?blueColor:Colors.grey),),//dark
                      Spacer(),
                      Visibility(
                          visible: !isLight,
                          child: Icon(Icons.check,color:!isLight?blueColor:blackColor)),
                    ],
                  ),
                ),
              ],),
          ),
        ),);
  }

}
