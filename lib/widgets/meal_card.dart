import 'package:flutter/material.dart';

import '../helpers/format_datetime.dart';
import '../models/meal.dart';

class MealCard extends StatelessWidget {
  final Meal meal;
  const MealCard({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 9.0,
      child: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text(meal.description)),
                Expanded(child: Text("${meal.calories} kcal")),
                Expanded(child: Text(formatDateTime(meal.dateTime))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
