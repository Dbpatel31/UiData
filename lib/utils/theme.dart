// app/themes/app_theme.dart
import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryBlue = Color(0xFF2196F3);
  static const Color darkBlue = Color(0xFF1976D2);
  static const Color lightBlue = Color(0xFFE3F2FD);
  static const Color accentBlue = Color(0xFF03A9F4);
  static const Color textDark = Color(0xFF333333);
  static const Color textLight = Color(0xFF666666);

  static ThemeData get lightTheme => ThemeData(
    primaryColor: primaryBlue,
    primaryColorDark: darkBlue,
    primaryColorLight: lightBlue,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Poppins',
    appBarTheme: AppBarTheme(
      backgroundColor: primaryBlue,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    ),
    cardTheme: CardTheme(
      elevation: 2,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    // textTheme: TextTheme(
    //   headline4: TextStyle(
    //     fontSize: 24,
    //     fontWeight: FontWeight.w700,
    //     color: textDark,
    //     fontFamily: 'Poppins',
    //   ),
    //   headline5: TextStyle(
    //     fontSize: 20,
    //     fontWeight: FontWeight.w600,
    //     color: textDark,
    //     fontFamily: 'Poppins',
    //   ),
    //   bodyText1: TextStyle(
    //     fontSize: 16,
    //     fontWeight: FontWeight.w500,
    //     color: textLight,
    //     fontFamily: 'Poppins',
    //   ),
    //   bodyText2: TextStyle(
    //     fontSize: 14,
    //     fontWeight: FontWeight.w400,
    //     color: textLight,
    //     fontFamily: 'Poppins',
    //   ),
    // ),
  );

  static ThemeData get darkTheme => ThemeData.dark().copyWith(
    primaryColor: primaryBlue,
    scaffoldBackgroundColor: Color(0xFF121212),
    cardTheme: CardTheme(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );
}