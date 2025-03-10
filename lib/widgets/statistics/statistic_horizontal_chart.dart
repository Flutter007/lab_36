import 'package:flutter/material.dart';
import 'package:lab36/helpers/format_datetime.dart';
import 'package:lab36/models/meal_expense.dart';
import 'package:lab36/widgets/statistics/statistics_card.dart';

import '../../models/calorie_max.dart';
import '../../theme/colors.dart';

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
    double percent = (widget.expense.calories!) / widget.calorie.calories!;
    final customColor = Theme.of(context).extension<CustomColor>()!;
    final titleMedium = Theme.of(
      context,
    ).textTheme.titleMedium!.copyWith(color: customColor.cardTextColor);
    return StatisticsCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Amount of calories for ${formatDate(widget.expense.dateTime)}",
            style: Theme.of(
              context,
            ).textTheme.titleLarge!.copyWith(color: customColor.cardTextColor),
          ),
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
                width: MediaQuery.of(context).size.width * percent,
                decoration: BoxDecoration(
                  color:
                      isMoreThanNorma
                          ? customColor.redShade
                          : customColor.greenShade,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    "${widget.expense.calories} kcal",
                    textAlign: TextAlign.center,
                    style: titleMedium,
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
