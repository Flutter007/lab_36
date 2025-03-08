import 'package:flutter/material.dart';

class StatisticsCard extends StatelessWidget {
  final Widget child;
  const StatisticsCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(26),
          child: child,
        ),
      ),
    );
  }
}
