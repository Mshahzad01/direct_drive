import 'package:direct_drive/src/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

mixin MyThemeData {
  static ThemeData themeData = ThemeData(
    useMaterial3: true,

    textTheme: TextTheme(
      titleLarge: GoogleFonts.manrope(
        fontSize: 34,        fontWeight: FontWeight.w700),
      titleMedium: GoogleFonts.manrope(fontWeight: FontWeight.w600),
      titleSmall: GoogleFonts.manrope(fontWeight: FontWeight.w600),

      bodySmall: GoogleFonts.manrope(fontWeight: FontWeight.w600),
      bodyLarge: GoogleFonts.manrope(fontWeight: FontWeight.w600),
      bodyMedium: GoogleFonts.manrope(fontWeight: FontWeight.w600),

      displayLarge: GoogleFonts.manrope(),

      displayMedium: GoogleFonts.manrope(),
      displaySmall: GoogleFonts.manrope(),
    ),

    inputDecorationTheme: InputDecorationTheme(
      hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
      fillColor: Colors.white,
    ),
    cardColor: Colors.white,
    highlightColor: Colors.grey.shade200,

    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: Colors.black),
       centerTitle: true,
      titleTextStyle: GoogleFonts.manrope(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.w600,
        
      ),
      
      scrolledUnderElevation: 0,
      elevation: 0,
    ),
    tabBarTheme: TabBarThemeData(
      unselectedLabelStyle: GoogleFonts.manrope(),
      labelStyle: GoogleFonts.manrope(fontWeight: FontWeight.w600),
      unselectedLabelColor: Colors.grey,
      indicatorColor: MyColors.primaryColor,
      indicatorSize: TabBarIndicatorSize.tab,
      labelColor: MyColors.primaryColor,
      dividerColor: Colors.transparent,
    ),
    scaffoldBackgroundColor: Colors.white,
  );
}
