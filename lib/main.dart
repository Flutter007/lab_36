import 'package:flutter/material.dart';
import 'package:lab36/lab36.dart';
import 'package:lab36/theme/dark_theme.dart';
import 'package:lab36/theme/light_theme.dart';

void main() {
  runApp(
    MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      home: Lab36(),
    ),
  );
}
