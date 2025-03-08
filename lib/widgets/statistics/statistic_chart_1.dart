import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:lab36/models/meal.dart';
import 'package:lab36/widgets/statistics/statistics_card.dart';

class StatisticChart1 extends StatelessWidget {
  final List<Meal> meals;
  const StatisticChart1({super.key, required this.meals});

  @override
  Widget build(BuildContext context) {
    Widget getTitles(double value, TitleMeta meta) {
      String txt = value.toInt().toString();

      return Text(
        txt,
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
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
          TextStyle(
            fontWeight: FontWeight.bold,
          ),
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
      leftTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      topTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      rightTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
    );
    LinearGradient barsGradient = LinearGradient(
      colors: [
        Colors.blue.shade800,
        Colors.blue.shade300,
      ],
      begin: Alignment.centerRight,
      end: Alignment.bottomRight,
    );

    return StatisticsCard(
      child: Container(
        height: 300,
        padding: EdgeInsets.symmetric(vertical: 14),
        margin: EdgeInsets.only(top: 10),
        child: BarChart(
          BarChartData(
            barTouchData: BarTouchData(
              touchTooltipData: getToolLipData,
            ),
            barGroups: meals
                .map(
                  (expense) => BarChartGroupData(
                    x: expense.dateTime.day,
                    showingTooltipIndicators: [0],
                    barRods: [
                      BarChartRodData(
                        gradient: barsGradient,
                        toY: 2,
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
