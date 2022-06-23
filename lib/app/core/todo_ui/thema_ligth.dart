import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const Color primaryColor = Color(0xFFbb1a7f);
const Color secondaryColor = Color(0xff951b81);
const Color gray3 = Color(0xFFECECEC);
const Color saffron = Color(0xfff4c430);
const Color smokeWhite = Color(0xfff5f5f5);
const Color green = Color(0xff00b03c);
const double kDividerHeight = 15;

const inputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(25)),
  borderSide: BorderSide(
    color: Colors.white,
  ),
);

const kBorderRadius = BorderRadius.all(
  Radius.circular(10),
);

class ThemeLigth {

  static ThemeData get theme => ThemeData.light().copyWith(
    primaryColor: primaryColor,
    colorScheme: ThemeData().colorScheme.copyWith(
          primary: primaryColor,
          secondary: secondaryColor,
        ),
    appBarTheme: const AppBarTheme(
      color: primaryColor,
      systemOverlayStyle: SystemUiOverlayStyle.light,
    ),
    scaffoldBackgroundColor: smokeWhite,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      splashColor: secondaryColor,
    ),
    iconTheme: const IconThemeData(color: primaryColor),
    textSelectionTheme: const TextSelectionThemeData(
      selectionColor: primaryColor,
      selectionHandleColor: primaryColor,
      cursorColor: primaryColor,
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.all(primaryColor),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.white,
      isDense: true,
      filled: true,
      labelStyle: const TextStyle(
        color: Color(0xFF999999),
        fontSize: 18,
      ),
      enabledBorder: inputBorder,
      focusColor: primaryColor,
      border: inputBorder,
      focusedBorder: inputBorder.copyWith(
        borderSide: const BorderSide(color: primaryColor),
      ),
      disabledBorder: inputBorder,
      errorBorder: inputBorder.copyWith(
        borderSide: const BorderSide(color: Colors.red),
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.all(Colors.white),
      overlayColor: MaterialStateProperty.all(primaryColor),
      checkColor: MaterialStateProperty.all(primaryColor),
    ),
    
    cardTheme: CardTheme(
      color: primaryColor,
      elevation: 0.8,
      surfaceTintColor: Colors.white,
      shadowColor: Colors.grey.shade700,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 25),
        primary: primaryColor,
        textStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
      ),
    ),
  );

  
}