

import 'package:boilerplate3/theme/text_theme_constants.dart';
import 'package:flutter/material.dart';

const colorPrimary = Color.fromRGBO(24, 41, 73, 1);
const colorButton = Color.fromRGBO(75, 110, 177, 1);
const colorGray = Color.fromRGBO(255, 232, 232, 1);

// const COLOR_ACCENT = ;

final lightTheme = ThemeData(
  primaryColor: colorPrimary,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: colorPrimary,

  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStateProperty.all(const TextStyle(color: colorButton)),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3),
          side: const BorderSide(color: colorGray),
        ),
      ),
    ),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: colorPrimary,
  ),
  primaryTextTheme: const TextTheme(
    headline6: headLine6,
    subtitle2: substitle2,
    subtitle1: subtitle1,
    //labelLarge: labelLarge,
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStateProperty.all(
        const TextStyle(
          color: colorPrimary,
        ),
      ),
    ),
  ),
  dividerTheme: const DividerThemeData(
    thickness: 1,
    indent: 20,
    endIndent: 20,
    color: Color.fromARGB(184, 13, 13, 13)  ),
  inputDecorationTheme: const InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.never,
    focusedBorder: OutlineInputBorder(
      borderSide:  BorderSide(color: colorPrimary, width: 2),
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(5),
      ),
    ),
    border: InputBorder.none,
    fillColor: colorGray,
    filled: true,
    
  ),
  

);
