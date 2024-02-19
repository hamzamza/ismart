import 'package:flutter/material.dart';

const Color greyBlue = Color(0xff597393);
const Color greyWhite = Color(0xffDDEAF3);
const Color busyColor = Color(0xFFF2C94C);
const Color availableColor = Color(0xFF37D858);
const Color offlineColor = Color(0xFFEB5757);
const Color nullColor = Color(0xFF222733);

class TextStyles {
  static const notifierTextLabel = TextStyle(
    fontSize: 26,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w300,
  );
}

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  primaryColor: Colors.black,
  floatingActionButtonTheme:
      const FloatingActionButtonThemeData(foregroundColor: Colors.black),
  dividerColor: Colors.black12,
  textTheme: const TextTheme(
    displayMedium: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
    titleMedium: TextStyle(fontSize: 22.0, fontStyle: FontStyle.italic),
    bodySmall: TextStyle(fontSize: 14.0),
  ),
  colorScheme: ColorScheme.dark(primary: Colors.grey.shade200)
      .copyWith(primary: Colors.deepPurple, background: greyBlue),
);

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  primaryColor: Colors.white,
  floatingActionButtonTheme:
      const FloatingActionButtonThemeData(foregroundColor: Colors.white),
  dividerColor: Colors.white54,
  textTheme: const TextTheme(
    displayMedium: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
    titleMedium: TextStyle(fontSize: 22.0, fontStyle: FontStyle.italic),
    bodySmall: TextStyle(fontSize: 14.0),
  ),
  colorScheme: const ColorScheme.light(primary: Colors.black54)
      .copyWith(primary: Colors.blue, background: greyWhite),
);
