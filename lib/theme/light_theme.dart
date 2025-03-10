import 'package:flutter/material.dart';
import 'package:lab36/theme/dark_theme.dart';
import 'colors.dart';

final lightColorScheme = ColorScheme.fromSeed(
  seedColor: Colors.lightGreen.shade700,
);
final lightCustomColors = CustomColor(
  bottomNavBarSelectedColor: Colors.black,
  cardTextColor: Colors.teal.shade900,
  cardBackgroundColor: Colors.yellow.shade300,
  greenShade: Colors.green.shade400,

  iconColor: Colors.white,
  redShade: Colors.red.shade500,
);
final lightTheme = ThemeData.light().copyWith(
  colorScheme: lightColorScheme,
  extensions: [lightCustomColors],
  appBarTheme: AppBarTheme().copyWith(
    backgroundColor: lightColorScheme.primaryContainer,
  ),
  navigationBarTheme: NavigationBarThemeData().copyWith(
    backgroundColor: lightColorScheme.primaryContainer,
  ),
  buttonTheme: ButtonThemeData().copyWith(colorScheme: lightColorScheme),
  inputDecorationTheme: InputDecorationTheme().copyWith(
    labelStyle: TextStyle(color: lightCustomColors.bottomNavBarSelectedColor),
    disabledBorder: borderStyle(lightCustomColors.bottomNavBarSelectedColor),
    enabledBorder: borderStyle(lightCustomColors.bottomNavBarSelectedColor),
    focusedBorder: borderStyle(lightCustomColors.bottomNavBarSelectedColor),
  ),
);
