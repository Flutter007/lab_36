import 'package:flutter/material.dart';

class CustomColor extends ThemeExtension<CustomColor> {
  final Color bottomNavBarSelectedColor;
  final Color cardTextColor;
  final Color cardBackgroundColor;

  final Color greenShade;
  final Color iconColor;
  final Color redShade;

  CustomColor({
    required this.bottomNavBarSelectedColor,
    required this.cardTextColor,
    required this.iconColor,
    required this.cardBackgroundColor,

    required this.greenShade,
    required this.redShade,
  });

  @override
  ThemeExtension<CustomColor> copyWith({
    Color? bottomNavBarSelectedColor,
    Color? cardTextColor,
    Color? cardBackgroundColor,
    Color? backgroundOfChart,
    Color? greenShade,
    Color? iconColor,
    Color? redShade,
  }) {
    return CustomColor(
      bottomNavBarSelectedColor:
          bottomNavBarSelectedColor ?? this.bottomNavBarSelectedColor,
      cardTextColor: cardTextColor ?? this.cardTextColor,
      cardBackgroundColor: cardBackgroundColor ?? this.cardBackgroundColor,

      greenShade: greenShade ?? this.greenShade,
      iconColor: iconColor ?? this.iconColor,
      redShade: redShade ?? this.redShade,
    );
  }

  @override
  ThemeExtension<CustomColor> lerp(
    covariant ThemeExtension<CustomColor>? other,
    double t,
  ) {
    if (other is! CustomColor) return this;
    return CustomColor(
      bottomNavBarSelectedColor:
          Color.lerp(
            bottomNavBarSelectedColor,
            other.bottomNavBarSelectedColor,
            t,
          )!,
      cardTextColor: Color.lerp(cardTextColor, other.cardTextColor, t)!,
      cardBackgroundColor:
          Color.lerp(cardBackgroundColor, other.cardBackgroundColor, t)!,
      iconColor: Color.lerp(iconColor, other.iconColor, t)!,

      greenShade: Color.lerp(greenShade, other.greenShade, t)!,
      redShade: Color.lerp(redShade, other.redShade, t)!,
    );
  }
}
