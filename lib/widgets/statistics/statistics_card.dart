import 'package:flutter/material.dart';
import 'package:lab36/theme/colors.dart';

class StatisticsCard extends StatelessWidget {
  final Widget child;
  const StatisticsCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final customColor = Theme.of(context).extension<CustomColor>()!;
    return SizedBox(
      width: double.infinity,
      child: Card(
        color: customColor.cardBackgroundColor,
        child: Padding(padding: EdgeInsets.all(26), child: child),
      ),
    );
  }
}
