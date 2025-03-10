import 'package:flutter/material.dart';
import 'package:lab36/models/calorie_max.dart';
import 'package:lab36/theme/colors.dart';
import 'package:lab36/widgets/statistics/statistics_card.dart';

import '../theme/dark_theme.dart';

class SettingsScreen extends StatefulWidget {
  final CalorieMax calories;
  final void Function(CalorieMax) updateCalories;

  const SettingsScreen({
    super.key,
    required this.calories,
    required this.updateCalories,
  });

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.text = widget.calories.calories.toString();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final customColor = Theme.of(context).extension<CustomColor>()!;
    final borderColor = borderStyle(customColor.cardTextColor);
    final txtColor = customColor.cardTextColor;
    return StatisticsCard(
      child: Container(
        color: customColor.cardBackgroundColor,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              style: TextStyle(color: txtColor),
              keyboardType: TextInputType.number,
              controller: controller,
              decoration: InputDecoration(
                labelText: 'Entry calories per day',
                labelStyle: TextStyle(color: txtColor),
                enabledBorder: borderColor,
                focusedBorder: borderColor,
                disabledBorder: borderColor,
                suffix: Text("kcal", style: TextStyle(color: txtColor)),
              ),
            ),
            TextButton(
              onPressed: () {
                widget.updateCalories(
                  CalorieMax(calories: int.parse(controller.text)),
                );
                FocusScope.of(context).unfocus();
              },
              child: Text("Save", style: TextStyle(color: txtColor)),
            ),
          ],
        ),
      ),
    );
  }
}
