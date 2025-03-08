import 'package:flutter/material.dart';
import 'package:lab36/lab36.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: Lab36(),
    ),
  );
}
