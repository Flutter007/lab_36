import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:lab36/helpers/format_datetime.dart';
import 'package:lab36/models/meal_expense.dart';
import 'package:lab36/widgets/statistics/statistics_card.dart';

class StatisticChart1 extends StatelessWidget {
  final List<MealExpense> meals;
  const StatisticChart1({super.key, required this.meals});

  @override
  Widget build(BuildContext context) {
    Widget getTitles(double value, TitleMeta meta) {
      String txt = value.toInt().toString();
      for (var expense in meals) {
        if (expense.dateTime.day == value.toInt()) {
          txt = '${zeroPad(expense.dateTime.day)}.${expense.dateTime.month}';
          break;
        }
      }
      return Text(
        txt,
        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
      );
    }

    BarTouchTooltipData getToolLipData = BarTouchTooltipData(
      getTooltipColor: (group) => Colors.transparent,
      tooltipPadding: EdgeInsets.zero,
      tooltipMargin: 8,
      getTooltipItem: (
        BarChartGroupData group,
        int groupIndex,
        BarChartRodData rod,
        int rodIndex,
      ) {
        return BarTooltipItem(
          rod.toY.round().toString(),
          TextStyle(fontWeight: FontWeight.bold),
        );
      },
    );

    FlTitlesData titlesData = FlTitlesData(
      show: true,
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 20,
          getTitlesWidget: getTitles,
        ),
      ),
      leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
    );
    LinearGradient barsGradient = LinearGradient(
      colors: [Colors.purpleAccent.shade700, Colors.blue.shade100],
      begin: Alignment.centerRight,
      end: Alignment.bottomLeft,
    );

    return StatisticsCard(
      child: Container(
        height: 230,
        padding: EdgeInsets.symmetric(vertical: 12),
        margin: EdgeInsets.only(top: 10),
        child: BarChart(
          BarChartData(
            barTouchData: BarTouchData(touchTooltipData: getToolLipData),
            barGroups:
                meals
                    .map(
                      (expense) => BarChartGroupData(
                        x: expense.dateTime.day,
                        showingTooltipIndicators: [0],
                        barRods: [
                          BarChartRodData(
                            gradient: barsGradient,
                            toY: (expense.calories ?? 0).toDouble(),
                            width: 12,
                          ),
                        ],
                      ),
                    )
                    .toList(),
            titlesData: titlesData,
            borderData: FlBorderData(show: false),
            gridData: FlGridData(show: false),
            alignment: BarChartAlignment.spaceBetween,
          ),
        ),
      ),
    );
  }
}
