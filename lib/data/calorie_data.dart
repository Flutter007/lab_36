import 'dart:convert';
import 'dart:io';
import 'package:lab36/models/calorie_max.dart';
import '../helpers/get_data_file_path.dart';

Future<void> saveCalorie(CalorieMax calorie) async {
  final filePath = await getDataFilePath('calorie');
  final file = File(filePath);
  final calorieMap = {"calories": calorie.calories};
  final calorieJson = jsonEncode(calorieMap);
  await file.writeAsString(calorieJson);
}

Future<CalorieMax> loadCalorie() async {
  try {
    final filePath = await getDataFilePath('calorie');
    final file = File(filePath);
    final jsonContents = await file.readAsString();
    final calorieMap = jsonDecode(jsonContents) as Map<String, dynamic>;
    return CalorieMax(calories: calorieMap['calories']);
  } catch (e) {
    return CalorieMax(calories: 2000);
  }
}
