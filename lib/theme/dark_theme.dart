import 'package:flutter/material.dart';

import 'colors.dart';

final darkColorScheme = ColorScheme.fromSeed(
  seedColor: Colors.greenAccent.shade700,
  brightness: Brightness.dark,
);
final darkCustomColors = CustomColor(
  bottomNavBarSelectedColor: Colors.white,
  cardTextColor: Colors.black,
  cardBackgroundColor: Colors.yellowAccent.shade400,
  greenShade: Colors.green.shade800,
  iconColor: Colors.black,
  redShade: Colors.red.shade800,
);
OutlineInputBorder borderStyle(Color color) =>
    OutlineInputBorder(borderSide: BorderSide(color: color));

final darkTheme = ThemeData.dark().copyWith(
  colorScheme: darkColorScheme,
  extensions: [darkCustomColors],
  appBarTheme: AppBarTheme().copyWith(
    backgroundColor: darkCustomColors.greenShade,
  ),
  navigationBarTheme: NavigationBarThemeData().copyWith(
    backgroundColor: darkCustomColors.greenShade,
  ),
  inputDecorationTheme: InputDecorationTheme().copyWith(
    labelStyle: TextStyle(color: darkCustomColors.bottomNavBarSelectedColor),
    disabledBorder: borderStyle(darkCustomColors.bottomNavBarSelectedColor),
    enabledBorder: borderStyle(darkCustomColors.bottomNavBarSelectedColor),
    focusedBorder: borderStyle(darkCustomColors.bottomNavBarSelectedColor),
  ),
);
