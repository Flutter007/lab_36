import 'package:uuid/uuid.dart';

final uuid = Uuid();

class Meal {
  final String id;
  final String description;
  final DateTime dateTime;
  final double calories;

  Meal({
    String? id,
    required this.description,
    required this.dateTime,
    required this.calories,
  }) : id = id ?? uuid.v4();
}
