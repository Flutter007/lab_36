import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:lab36/models/meal.dart';
import 'package:lab36/widgets/meal_card.dart';

import '../theme/colors.dart';

class HistoryScreen extends StatelessWidget {
  final List<Meal> meals;
  final void Function(String id) onMealDelete;
  const HistoryScreen({
    super.key,
    required this.meals,
    required this.onMealDelete,
  });

  @override
  Widget build(BuildContext context) {
    final customColor = Theme.of(context).extension<CustomColor>()!;
    return ListView.builder(
      itemBuilder: (ctx, index) {
        final meal = meals[index];
        return Slidable(
          endActionPane: ActionPane(
            motion: BehindMotion(),
            children: [
              SlidableAction(
                icon: Icons.delete,
                label: "Delete",
                backgroundColor: customColor.redShade,
                padding: EdgeInsets.zero,
                onPressed: (ctx) => onMealDelete(meal.id),
              ),
            ],
          ),
          child: MealCard(meal: meal),
        );
      },
      itemCount: meals.length,
    );
  }
}
