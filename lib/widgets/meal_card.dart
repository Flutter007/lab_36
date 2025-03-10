import 'package:flutter/material.dart';
import 'package:lab36/theme/colors.dart';

import '../helpers/format_datetime.dart';
import '../models/meal.dart';

class MealCard extends StatelessWidget {
  final Meal meal;
  const MealCard({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    final customColor = Theme.of(context).extension<CustomColor>()!;
    final titleMedium = Theme.of(
      context,
    ).textTheme.titleMedium!.copyWith(color: customColor.cardTextColor);
    return Card(
      color: customColor.cardBackgroundColor,
      elevation: 9.0,
      child: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    textAlign: TextAlign.center,
                    meal.description,
                    style: titleMedium,
                  ),
                ),
                SizedBox(width: 2),
                Expanded(
                  child: Text(
                    textAlign: TextAlign.center,
                    "${meal.calories} kcal",
                    style: titleMedium,
                  ),
                ),
                Expanded(
                  child: Text(
                    textAlign: TextAlign.right,
                    formatDateTime(meal.dateTime),
                    style: titleMedium,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
