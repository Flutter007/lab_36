import 'package:flutter/material.dart';
import 'package:lab36/helpers/format_datetime.dart';
import 'package:lab36/models/meal_expense.dart';
import 'package:lab36/widgets/statistics/statistics_card.dart';

import '../../models/calorie_max.dart';

class StatisticHorizontalChart extends StatefulWidget {
  final MealExpense expense;
  final CalorieMax calorie;
  const StatisticHorizontalChart({
    super.key,
    required this.expense,
    required this.calorie,
  });

  @override
  State<StatisticHorizontalChart> createState() =>
      _StatisticHorizontalChartState();
}

class _StatisticHorizontalChartState extends State<StatisticHorizontalChart> {
  @override
  Widget build(BuildContext context) {
    bool isMoreThanNorma = widget.expense.calories! > widget.calorie.calories!;
    double percentage = (widget.expense.calories!) / widget.calorie.calories!;

    return StatisticsCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Кол-во калорий за ${formatDate(widget.expense.dateTime)}"),
          SizedBox(height: 10),
          Stack(
            children: [
              Container(
                height: 20,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.grey.shade500,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              Container(
                height: 20,
                width: MediaQuery.of(context).size.width * percentage,
                decoration: BoxDecoration(
                  color: isMoreThanNorma ? Colors.red : Colors.green,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    "${widget.expense.calories} ккал",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
