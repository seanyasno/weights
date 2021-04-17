import 'package:google_fonts/google_fonts.dart';
import 'package:weights/abstraction/abstractions.dart';
import 'package:flutter/material.dart';

class AppThemeFactory {
  static ThemeData getThemeData(BuildContext context, ThemeType themeType) {
    final darkTextTheme = Theme.of(context).textTheme.apply(
      bodyColor: Colors.white
    );

    switch (themeType) {
      case ThemeType.DARK:
        return ThemeData(
          primaryColor: Color(0xfff05454),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          dividerColor: Colors.transparent,
          textTheme: GoogleFonts.ralewayTextTheme(darkTextTheme),
          backgroundColor: Color(0xff214252),
          indicatorColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.white),
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: Colors.white
          ),
        );
      default:
        return null;
    }
  }
}