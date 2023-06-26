import 'package:flutter/material.dart';

class BookThemeStyle extends ThemeExtension<BookThemeStyle> {
  const BookThemeStyle({
    required this.bodyColor,
    required this.appBarStyle,
  });

  final Color? bodyColor;
  final TextStyle? appBarStyle;

  @override
  ThemeExtension<BookThemeStyle> copyWith({
    Color? bodyColor,
    TextStyle? appbarStyle,
  }) {
    return BookThemeStyle(
      bodyColor: bodyColor ?? this.bodyColor,
      appBarStyle: appBarStyle ?? this.appBarStyle,
    );
  }

  @override
  ThemeExtension<BookThemeStyle> lerp(
      covariant ThemeExtension<BookThemeStyle>? other, double t) {
    if (other is! BookThemeStyle) {
      return this;
    }

    return BookThemeStyle(
      bodyColor: Color.lerp(bodyColor, other.bodyColor, t),
      appBarStyle: TextStyle.lerp(appBarStyle, other.appBarStyle, t),
    );
  }
}
