import 'package:flutter/material.dart';
import 'package:lab36/models/meal.dart';

import '../helpers/format_datetime.dart';

class MealAdd extends StatefulWidget {
  final void Function(Meal newMeal) addMeal;
  final Meal? existingMeal;
  const MealAdd({super.key, required this.addMeal, this.existingMeal});

  @override
  State<MealAdd> createState() => _MealAddState();
}

class _MealAddState extends State<MealAdd> {
  var selectedDate = DateTime.now();
  var selectedTimeOfDay = TimeOfDay.now();

  final dateController = TextEditingController();
  final timeController = TextEditingController();
  final titleController = TextEditingController();
  final caloriesController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.existingMeal != null) {
      final existingMeal = widget.existingMeal!;
      titleController.text = existingMeal.description;
      caloriesController.text = existingMeal.calories.toString();
      selectedDate = existingMeal.dateTime;
      selectedTimeOfDay = TimeOfDay.fromDateTime(selectedDate);
    }
    dateController.text = formatDate(selectedDate);
    timeController.text = formatTime(selectedTimeOfDay);
  }

  @override
  void dispose() {
    dateController.dispose();
    timeController.dispose();
    titleController.dispose();
    super.dispose();
  }

  void onCancel() {
    setState(() {
      Navigator.pop(context);
    });
  }

  bool isMealValid() {
    final parsedCalories = double.tryParse(caloriesController.text);
    final isValidTitle = titleController.text.trim().isEmpty;
    final isValidCalories = parsedCalories == null || parsedCalories <= 0;
    return isValidTitle || isValidCalories;
  }

  void onSave() {
    if (isMealValid()) {
      return;
    }
    final dateTime = DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
      selectedTimeOfDay.hour,
      selectedTimeOfDay.minute,
    );

    final addMeal = Meal(
      id: widget.existingMeal?.id,
      description: titleController.text.trim(),
      dateTime: dateTime,
      calories: double.tryParse(caloriesController.text)!,
    );
    widget.addMeal(addMeal);
    Navigator.pop(context);
  }

  void onDateTap() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year, now.month, now.day - 1);
    final lastDate = DateTime(now.year, now.month, now.day);

    final dateFromUser = await showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: lastDate,
      initialDate: selectedDate,
    );
    if (dateFromUser != null) {
      setState(() {
        selectedDate = dateFromUser;
        dateController.text = formatDate(dateFromUser);
      });
    }
  }

  void onTimeTap() async {
    final selectedTime = await showTimePicker(
      context: context,
      initialTime: selectedTimeOfDay,
    );
    if (selectedTime != null) {
      setState(() {
        selectedTimeOfDay = selectedTime;
        timeController.text = formatTime(selectedTime);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final bottomInsets = MediaQuery.of(context).viewInsets.bottom;

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.fromLTRB(24, 24, 24, 24 + bottomInsets),
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    onTap: onDateTap,
                    readOnly: true,
                    controller: dateController,
                    decoration: const InputDecoration(
                      labelText: 'Date of meal',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    onTap: onTimeTap,
                    readOnly: true,
                    controller: timeController,
                    decoration: const InputDecoration(
                      labelText: 'Time of meal',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Title of meal',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: caloriesController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                suffix: Text("kcal"),

                labelText: 'Amount of calories',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: onCancel,
                    child: Text('Cancel'),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: isMealValid() ? null : onSave,
                    child: Text('Save'),
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
