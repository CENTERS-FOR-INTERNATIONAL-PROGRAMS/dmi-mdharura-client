import 'package:flutter/material.dart';

final ThemeData kAppTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  appBarTheme: AppBarTheme(
    iconTheme: const IconThemeData(color: Colors.white),
    actionsIconTheme: const IconThemeData(color: Colors.white),
    toolbarTextStyle: const TextTheme(
      titleLarge: TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.bold,
        fontFamily: 'Poppins',
      ),
    ).bodyMedium,
    titleTextStyle: const TextTheme(
      titleLarge: TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.bold,
        fontFamily: 'Poppins',
      ),
    ).titleLarge,
  ),
  tabBarTheme: const TabBarTheme(
    labelColor: Colors.white,
    unselectedLabelColor: Colors.white60,
    labelStyle: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 12,
      fontFamily: 'Poppins',
    ),
    unselectedLabelStyle: TextStyle(
      color: Colors.white,
      fontSize: 12,
      fontFamily: 'Poppins',
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.white60,
    backgroundColor: Colors.lightGreen,
    type: BottomNavigationBarType.fixed,
  ),
  fontFamily: 'Poppins',
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      minimumSize: MaterialStateProperty.all(const Size(64, 48)),
      elevation: MaterialStateProperty.all(0),
      textStyle: MaterialStateProperty.all(
        const TextStyle(
          color: Colors.white,
        ),
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      minimumSize: MaterialStateProperty.all(const Size(64, 48)),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      minimumSize: MaterialStateProperty.all(const Size(64, 48)),
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.redAccent,
    foregroundColor: Colors.white,
  ),
  colorScheme: const ColorScheme.light(
    primary: Colors.lightGreen,
    secondary: Colors.lightGreen,
  ).copyWith(background: Colors.white),
);
