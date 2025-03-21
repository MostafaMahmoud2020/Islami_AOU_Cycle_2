import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeData {
  static Color blackColor = Color(0xFF242424);
  static Color whiteColor = Color(0xFFFFFFFF);
  static Color primaryColor = Color(0xFFB7935F);

  static ThemeData lightTheme = ThemeData(
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
}
