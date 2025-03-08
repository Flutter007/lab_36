import 'package:flutter/material.dart';
import 'package:lab36/widgets/statistics/statistics_card.dart';

import '../models/meal.dart';

class MainScreen extends StatelessWidget {
  final List<Meal> meals;
  const MainScreen({super.key, required this.meals});

  @override
  Widget build(BuildContext context) {
    final allCalories = meals.fold(0.0, (prev, m) => prev + m.calories);
    if (meals.isEmpty) {
      return Center(child: Text('No data!'));
    }
    return StatisticsCard(child: Text(allCalories.toString()));
  }
}
