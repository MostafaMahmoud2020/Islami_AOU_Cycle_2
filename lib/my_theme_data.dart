import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeData {
  static Color blackColor = Color(0xFF242424);
  static Color whiteColor = Color(0xFFFFFFFF);
  static Color primaryColor = Color(0xFFB7935F);
  static Color yellowColor = Color(0xFFFACC1D);
  static Color darkColor = Color(0xFF141A2E);

  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: whiteColor,
        onPrimary: blackColor,
        secondary: primaryColor,
        onSecondary: whiteColor,
        surface: whiteColor,
        onSurface: blackColor, error: Colors.red, onError: Colors.white),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.shifting,
      selectedItemColor: blackColor,
      unselectedItemColor: whiteColor,


    ),
    appBarTheme: AppBarTheme(backgroundColor: Colors.transparent),
    scaffoldBackgroundColor: Colors.transparent,
    textTheme: TextTheme(
        bodySmall: GoogleFonts.elMessiri(color: blackColor, fontSize: 20),
        bodyMedium: GoogleFonts.elMessiri(color: blackColor, fontSize: 25),
        bodyLarge: GoogleFonts.elMessiri(color: blackColor, fontSize: 30,fontWeight: FontWeight.bold)),
  );



  static ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: darkColor,
        onPrimary: yellowColor,
        secondary: darkColor,
        onSecondary: whiteColor,
        surface: darkColor,
        onSurface: yellowColor, error: Colors.red, onError: Colors.white),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.shifting,
      selectedItemColor: yellowColor,
      unselectedItemColor: whiteColor,


    ),
    appBarTheme: AppBarTheme(backgroundColor: Colors.transparent),
    scaffoldBackgroundColor: Colors.transparent,
    textTheme: TextTheme(
        bodySmall: GoogleFonts.elMessiri(color: whiteColor, fontSize: 20),
        bodyMedium: GoogleFonts.elMessiri(color: yellowColor, fontSize: 25),
        bodyLarge: GoogleFonts.elMessiri(color: whiteColor, fontSize: 30,fontWeight: FontWeight.bold)),
  );
}
