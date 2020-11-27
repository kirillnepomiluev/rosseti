import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

enum MyThemeKeys {LIGHTFC, DARKFC}

class MyThemes {


  static final ThemeData lightThemeFcNnFonts = ThemeData(

    primaryColor: mainbackgroundlight,
    primaryColorDark: mainbackgroundlight,
    backgroundColor: mainbackgroundlight,
    accentColor: activbottombariconlight,
    scaffoldBackgroundColor: mainbackgroundlight,
    dialogBackgroundColor: Colors.orange,
    brightness: Brightness.light,
    cardColor: boxlight,
    appBarTheme: AppBarTheme(
      color: mainbackgroundlight,
    ),
    textTheme: TextTheme(
      // Используется для вспомогательного текста, связанного с изображениями.
      caption: TextStyle(
          color: redSelected,
          fontFamily: "PTRootUI",
          fontSize: 16 ),

      bodyText1: TextStyle(
        color: textDisable,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        fontSize: 14,
        fontFamily: "PTRootUI",
      ),
      // Стиль текста по умолчанию для материала
      bodyText2: TextStyle(
        color: textLight,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        fontSize: 14,
        fontFamily: "PTRootUI",
      ),

      //Используется для большого текста в диалоговых окнах (например, месяц и год в диалоговом окне, отображаемом showDatePicker ).
      headline5: TextStyle(
        fontSize: 20,
        fontFamily: "PTRootUI",
        color: appbartexstlight,
      ),
      // для панелей приложений апп бар и тд
      headline6: TextStyle(
        color: greytextbodylight,
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
        fontSize: 20,
        fontFamily: "PTRootUI",
      ),

      subtitle2: TextStyle(color: appbartexstlight, fontSize: 20),

      headline4: TextStyle(
          color: noactivsdrawericonlight,
          fontSize: 24,
          fontFamily: "PTRootUI",
          letterSpacing: 1.1),


      // боковое меню  Веделенное текст и цвет иконок
      headline3: TextStyle(
          color: activbottombariconlight,
          fontSize: 24,
          fontFamily: "PTRootUI",
          letterSpacing: 1.1),

    ),
    primaryIconTheme: IconThemeData(color: appbartexstlight),
    tabBarTheme: TabBarTheme(
        unselectedLabelStyle: TextStyle(color: noactivbottombariconlight),
        labelStyle: TextStyle(color: activbottombariconlight),
        labelColor: activbottombariconlight,
        unselectedLabelColor: noactivbottombariconlight),
  );
  static final ThemeData darkThemeFcNnFonts = ThemeData(
    primaryColor: mainbackgrounddark,
    primaryColorDark: mainbackgrounddark,
    backgroundColor: mainbackgrounddark,
    accentColor: activbottombaricondark,
    scaffoldBackgroundColor: mainbackgrounddark,
    dialogBackgroundColor: Colors.orange,
    brightness: Brightness.dark,
    cardColor: boxdark,
    appBarTheme: AppBarTheme(
      color: mainbackgrounddark,
    ),
    textTheme: TextTheme(
      caption: TextStyle(color: redSelected, fontFamily: "PTRootUI",fontSize: 16 ),
      bodyText1: TextStyle(color: greytextbodydark),
      bodyText2: TextStyle(color: greytextbodydark,
        fontSize: 14,
        fontFamily: "PTRootUI",
      ),

      headline5: TextStyle(
        fontFamily: "PTRootUI",
        fontSize: 20,
        color: appbartexstdark,
      ),

      headline6: TextStyle(
          color: appbartexstdark,
          fontSize: 24,
          fontFamily: "PTRootUI",
          letterSpacing: 1.1),

      subtitle2: TextStyle(color: appbartexstdark, fontSize: 18),

      headline4: TextStyle(
          color: noactivsdrawericondark,
          fontSize: 24,
          fontFamily: "PTRootUI",
          letterSpacing: 1.1),


      // боковое меню  Веделенное текст и цвет иконок
      headline3: TextStyle(
          color: activbottombariconlight,
          fontSize: 24,
          fontFamily: "PTRootUI",
          letterSpacing: 1.1),
    ),


    primaryIconTheme: IconThemeData(color: appbartexstdark),
    tabBarTheme: TabBarTheme(
        unselectedLabelStyle: TextStyle(color: noactivbottombaricondark),
        labelStyle: TextStyle(color: activbottombariconlight),
        labelColor: activbottombariconlight,
        unselectedLabelColor: noactivbottombaricondark),
  );

  static ThemeData getThemeFromKey(MyThemeKeys themeKey) {
    switch (themeKey) {
      case MyThemeKeys.LIGHTFC:
        return lightThemeFcNnFonts;
      case MyThemeKeys.DARKFC:
        return darkThemeFcNnFonts;
      default:
        return lightThemeFcNnFonts;
    }
  }
}
