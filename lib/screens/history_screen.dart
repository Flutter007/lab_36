import 'package:flutter/material.dart';
import 'package:lab36/models/meal.dart';

class HistoryScreen extends StatelessWidget {
  final List<Meal> meals;
  const HistoryScreen({super.key, required this.meals});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (ctx, index) {});
  }
}
