import 'package:flutter/material.dart';
import 'package:lab36/models/meal_expense.dart';
import 'package:lab36/widgets/statistics/statistics_card.dart';

import '../models/meal.dart';
import '../widgets/statistics/statistic_barchart.dart';
import '../widgets/statistics/statistic_horizontal_chart.dart';

class MainScreen extends StatelessWidget {
  final List<Meal> meals;
  const MainScreen({super.key, required this.meals});

  List<MealExpense> get mealExpenses {
    final List<MealExpense> mealExpenses = [];

    final now = DateTime.now();
    for (var i = 0; i < 7; i++) {
      final date = now.subtract(Duration(days: i));
      double totalCalories = 0;
      for (var meal in meals) {
        if (meal.dateTime.day == date.day &&
            meal.dateTime.month == date.month) {
          totalCalories += meal.calories;
        }
      }

      mealExpenses.add(MealExpense(dateTime: date, calories: totalCalories));
    }
    return mealExpenses.reversed.toList();
  }

  @override
  Widget build(BuildContext context) {
    late double? allCalories;

    for (var meal in mealExpenses) {
      if (meal.dateTime.day == DateTime.now().day &&
          meal.dateTime.month == DateTime.now().month) {
        allCalories = meal.calories;
      }
    }
    if (meals.isEmpty) {
      return Center(child: Text('No data!'));
    }
    return Column(
      children: [
        StatisticsCard(
          child: Text(
            "Total calories:\n$allCalories kcal",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        StatisticChart1(meals: mealExpenses),
        StatisticHorizontalChart(expense: mealExpenses[6]),
      ],
    );
  }
}
