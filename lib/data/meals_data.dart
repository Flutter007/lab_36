import 'dart:convert';
import 'dart:io';
import 'package:lab36/models/meal.dart';
import '../helpers/get_data_file_path.dart';

Future<void> saveMeal(List<Meal> meals) async {
  final filePath = await getDataFilePath('meals');
  final file = File(filePath);
  final mealsMap =
      meals
          .map(
            (meal) => {
              "id": meal.id,
              "description": meal.description,
              "dateTime": meal.dateTime.toIso8601String(),
              "calories": meal.calories,
            },
          )
          .toList();

  final mealsJson = jsonEncode(mealsMap);
  await file.writeAsString(mealsJson);
}

Future<List<Meal>> loadMeals() async {
  try {
    final filePath = await getDataFilePath('meals');
    final file = File(filePath);
    final jsonContents = await file.readAsString();
    final mealsMap = jsonDecode(jsonContents) as List<dynamic>;
    return mealsMap.map((mealMap) {
      return Meal(
        id: mealMap['id'],
        description: mealMap['description'],
        dateTime: DateTime.parse(mealMap['dateTime']),
        calories: mealMap['calories'],
      );
    }).toList();
  } catch (error) {
    return [];
  }
}
