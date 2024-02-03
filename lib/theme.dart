import 'package:flutter/material.dart';

class MyTheme {
  static Color blackColor = Color(0xff242424);
  static Color primaryColor = Color(0xffB7935F);
  static Color secondaryColor= Color(0x8cb7935f);
  static Color yellowColor= Color(0xffFACC1D);
  static Color whiteColor=Color(0xffF8F8F8);
  static Color primaryColorDarkMode=Color(0xff141A2E);

  static ThemeData lightMode = ThemeData(
    bottomNavigationBarTheme:
        BottomNavigationBarThemeData(selectedItemColor: blackColor,),
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontFamily: 'ElMessiri-SemiBold.ttf',
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: blackColor,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'ElMessiri-SemiBold.ttf',
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: blackColor,
      ),
      bodySmall: TextStyle(
        fontFamily: 'ElMessiri-SemiBold.ttf',
        fontSize: 25,
        fontWeight: FontWeight.normal,
        color: blackColor,
      ),
    ),
  );
  static ThemeData darkMode=ThemeData(
    bottomNavigationBarTheme:
    BottomNavigationBarThemeData(selectedItemColor: yellowColor,),
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      iconTheme: IconThemeData(color: whiteColor),
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontFamily: 'ElMessiri-SemiBold.ttf',
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: whiteColor,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'ElMessiri-SemiBold.ttf',
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: whiteColor,
      ),
      bodySmall: TextStyle(
        fontFamily: 'ElMessiri-SemiBold.ttf',
        fontSize: 25,
        fontWeight: FontWeight.normal,
        color: whiteColor,
      ),
    ),
  );
}
