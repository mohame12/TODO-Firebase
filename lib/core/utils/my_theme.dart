import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo2/core/utils/my_color.dart';
import 'package:todo2/core/utils/my_style.dart';

class MyTheme
{
  static ThemeData light=ThemeData.light().copyWith(
    scaffoldBackgroundColor:scaffoldColor,
      elevatedButtonTheme: ElevatedButtonThemeData(style:ButtonStyle(textStyle:WidgetStatePropertyAll<TextStyle>(MyStyle.textStyle18.copyWith(color: whiteColor)))),
      cardTheme: const CardTheme(
          color: whiteColor
      ),

    textTheme:GoogleFonts.poppinsTextTheme(),
    appBarTheme: const AppBarTheme(
        scrolledUnderElevation: 0,
      iconTheme: IconThemeData(color: whiteColor),
      elevation: 0,
      color: blueColor,
      titleTextStyle: MyStyle.textStyle22,
      systemOverlayStyle:SystemUiOverlayStyle(
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
        statusBarColor: blueColor
      )
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      color: whiteColor,
      elevation: 0,
      padding: EdgeInsets.zero,
      shape: CircularNotchedRectangle(),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: Colors.transparent,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      unselectedItemColor: greyColor,
      selectedItemColor: blueColor,
    )
  );




  static ThemeData dark=ThemeData.dark().copyWith(
      scaffoldBackgroundColor:darkScaffold,
      elevatedButtonTheme: ElevatedButtonThemeData(style:ButtonStyle(textStyle:WidgetStatePropertyAll<TextStyle>(MyStyle.textStyle18.copyWith(color: whiteColor)))),
      cardTheme: const CardTheme(
        color: Color(0xff141922)
      ),
      textTheme:GoogleFonts.poppinsTextTheme(),
      appBarTheme:  AppBarTheme(
          scrolledUnderElevation: 0,
          iconTheme: const IconThemeData(color: blackColor),
          elevation: 0,
          color: blueColor,
          titleTextStyle: MyStyle.textStyle22.copyWith(color: const Color(0xff141922),),
          systemOverlayStyle:const SystemUiOverlayStyle(
              systemNavigationBarIconBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.dark,
              statusBarBrightness: Brightness.dark,
              statusBarColor: blueColor
          )
      ),
      bottomAppBarTheme: const BottomAppBarTheme(
        color: Color(0xff141922),
        elevation: 0,
        padding: EdgeInsets.zero,
        shape: CircularNotchedRectangle(),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        elevation: 0,
        backgroundColor: Colors.transparent,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        unselectedItemColor: whiteColor,
        selectedItemColor: blueColor,
      )
  );
}