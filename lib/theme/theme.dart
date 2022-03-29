import 'package:flutter/material.dart';

class Themes {
  static final dark = ThemeData(
    colorScheme: ColorScheme(
      background: Colors.black,
      primaryVariant: kDarkGreen,
      brightness: Brightness.dark,
      secondaryVariant: kGreen,
      onBackground: Colors.grey[800]!,
      surface: Colors.grey[900]!,
      error: Colors.red,
      onError: Colors.amber,
      onSurface: Colors.yellow,
      onPrimary: Colors.yellow,
      onSecondary: Colors.yellow,
      primary: kGreen,
      secondary: kGreen,
    ),
    splashColor: kGreen,
    accentColor: Colors.white,
    brightness: Brightness.dark,
    cardColor: Colors.grey[900],
    scaffoldBackgroundColor: Colors.black,
    drawerTheme: const DrawerThemeData(
      backgroundColor: kBackground,
    ),
    primaryColor: const Color(0xFF8cc63f),
    indicatorColor: kGreen,
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.grey[800],
      disabledColor: Colors.grey,
    ),
    // shadowColor: Colors.grey,
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        color: Colors.white,
      ),
      bodyText2: TextStyle(
        color: Colors.white,
      ),
      button: TextStyle(color: Colors.white),
      headline1: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      headline2: TextStyle(color: Colors.white),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey[900],
      actionsIconTheme: const IconThemeData(color: Colors.white),
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
      elevation: 2.0,
      iconTheme: const IconThemeData(color: Colors.white),
      // systemOverlayStyle: SystemUiOverlayStyle.light,
      foregroundColor: Colors.white,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.grey[900],
    ),
    backgroundColor: Colors.black,
    primaryTextTheme: const TextTheme(
      bodyText1: TextStyle(color: kGreen),
      bodyText2: TextStyle(color: kGreen),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: Colors.black,
      modalBackgroundColor: Colors.grey[800],
    ),
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: Colors.grey[900]),
    dividerColor: Colors.grey[300],
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.grey[900],
    ),
  );

  ///GAPPPPP

  static final light = ThemeData(
    colorScheme: ColorScheme(
      background: const Color(0xFFf9f9f9),
      primaryVariant: kDarkGreen,
      brightness: Brightness.light,
      secondaryVariant: kGreen,
      onBackground: Colors.grey[800]!,
      surface: Colors.grey[900]!,
      error: Colors.red,
      onError: Colors.red,
      onSurface: Colors.black,
      onPrimary: Colors.red,
      onSecondary: Colors.white, //Button Text Theme
      primary: kGreen,
      secondary: kGreen,
    ),
    splashColor: kGreen,
    accentColor: Colors.black,
    brightness: Brightness.light,
    cardColor: Colors.white,
    scaffoldBackgroundColor: const Color(0xFFF9F9F9),
    primaryColor: const Color(0xFF8cc63f),
    indicatorColor: kGreen,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFFf9f9f9),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFf9f9f9),
      actionsIconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
      elevation: 2.0,
      iconTheme: IconThemeData(color: Colors.black),
      // systemOverlayStyle: SystemUiOverlayStyle.dark,
    ),
    backgroundColor: const Color(0xFFf9f9f9),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.blue,
      disabledColor: Colors.grey,
    ),
    textTheme: TextTheme(
      bodyText1: const TextStyle(color: Colors.black),
      bodyText2: const TextStyle(color: Colors.black),
      button: const TextStyle(color: kBlue),
      headline1: TextStyle(
        color: Colors.grey[800],
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      headline2: const TextStyle(color: Colors.blueGrey),
    ),
    primaryTextTheme: const TextTheme(
      bodyText1: TextStyle(color: kGreen),
      bodyText2: TextStyle(color: kGreen),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Color(0xFFf9f9f9),
      modalBackgroundColor: Colors.white,
    ),
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: Color(0xFFf9f9f9)),
    dividerColor: Colors.grey[900],
    inputDecorationTheme: const InputDecorationTheme(
      fillColor: Color(0xFFEBEFF2),
    ),
  );
}

const kGreen = Color(0xFF8cc63f);
const kDarkGreen = Color(0xFF7cb235);
const kBlue = Color(0xFF2e3192);
const kBackground = Color(0xFF212121);
