import 'package:flutter/material.dart';
import 'package:lab36/models/calorie_max.dart';

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
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24),
      child: Column(
        children: [
          TextField(
            keyboardType: TextInputType.number,
            controller: controller,
            decoration: InputDecoration(
              labelText: 'Entry calories per day',
              border: OutlineInputBorder(),
              suffix: Text("kcal"),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              widget.updateCalories(
                CalorieMax(calories: double.parse(controller.text)),
              );
              FocusScope.of(context).unfocus();
            },
            child: Text("Save"),
          ),
        ],
      ),
    );
  }
}
