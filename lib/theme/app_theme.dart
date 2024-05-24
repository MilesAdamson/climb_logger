import 'package:flutter/material.dart';

class AppTheme {
  late final ThemeData themeData = ThemeData.dark().copyWith(
    primaryColor: Colors.deepPurple,
    scaffoldBackgroundColor: Colors.grey[900],
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            fontSize: 14.0,
            color: Colors.white,
          ),
        ),
        foregroundColor: MaterialStateProperty.all(Colors.white),
        backgroundColor: MaterialStateProperty.all(Colors.black),
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.white,
              width: 2.0,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.all(Radius.circular(16.0)),
          ),
        ),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey[850],
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: _inputBorder(),
      disabledBorder: _inputBorder(),
      focusedBorder: _inputBorder(color: Colors.white),
      errorBorder: _inputBorder(),
      enabledBorder: _inputBorder(),
      focusedErrorBorder: _inputBorder(),
      focusColor: Colors.white,
      fillColor: Colors.white,
      iconColor: Colors.white,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      floatingLabelStyle: const TextStyle(color: Colors.white),
      labelStyle: const TextStyle(color: Colors.white),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: Colors.grey[800],
      actionTextColor: Colors.blue,
      contentTextStyle: const TextStyle(color: Colors.white),
    ),
    cardColor: Colors.grey[850],
    toggleableActiveColor: Colors.white,
    bottomAppBarColor: Colors.white,
    tabBarTheme: const TabBarTheme(
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: Colors.white),
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.all(Colors.white),
      checkColor: MaterialStateProperty.all(Colors.black),
    ),
    dividerTheme: DividerThemeData(
      thickness: 1.0,
      color: Colors.grey[800]!,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: Colors.white,
      backgroundColor: Colors.green,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.transparent,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: _baseButtonStyle().copyWith(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.grey[800]!),
        overlayColor: MaterialStateProperty.all<Color>(Colors.lightBlue[50]!),
      ),
    ),
    textTheme: ThemeData.dark().textTheme.copyWith(
          headline1: ThemeData.dark().textTheme.headline1!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w300,
                fontSize: 75.0,
              ),
          headline2: ThemeData.dark().textTheme.headline2!.copyWith(
                color: Colors.white,
                fontSize: 55.0,
              ),
          headline3: ThemeData.dark().textTheme.headline3!.copyWith(
                color: Colors.white,
              ),
          headline4: ThemeData.dark().textTheme.headline4!.copyWith(
                color: Colors.white,
              ),
          headline5: ThemeData.dark().textTheme.headline5!.copyWith(
                color: Colors.white,
              ),
          headline6: ThemeData.dark().textTheme.headline6!.copyWith(
                color: Colors.white,
              ),
        ),
  );

  ButtonStyle _baseButtonStyle() {
    return ButtonStyle(
      minimumSize: MaterialStateProperty.all<Size>(
        const Size(100, 50.0),
      ),
      textStyle: MaterialStateProperty.all<TextStyle>(
        const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(32.0),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder _inputBorder({Color color = Colors.white60}) =>
      OutlineInputBorder(
        borderSide: BorderSide(color: color),
        borderRadius: const BorderRadius.all(
          Radius.circular(16.0),
        ),
      );
}
