import 'package:flutter/material.dart';
import 'package:theming_demo/book_theme_style.dart';

const Color primaryColor = Color(0xFF386A20);

ThemeData lightAppTheme(BuildContext context, {Color? customColor}) =>
    appTheme(Brightness.light, true, customColor: customColor).copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      extensions: <ThemeExtension<dynamic>>[
        BookThemeStyle(
          bodyColor: Colors.red,
          appBarStyle: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: Colors.red),
        ),
      ],
    );

ThemeData darkAppTheme(BuildContext context) =>
    appTheme(Brightness.dark, true).copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      extensions: <ThemeExtension<dynamic>>[
        BookThemeStyle(
          bodyColor: Colors.blue,
          appBarStyle: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: Colors.blue),
        ),
      ],
    );

ThemeData appTheme(Brightness mode, bool useMaterial3, {Color? customColor}) =>
// option 9
    ThemeData.from(
      colorScheme: ColorScheme.fromSeed(
        brightness: mode,
        seedColor: customColor ?? primaryColor,
        primary: customColor ?? primaryColor,
      ),
      useMaterial3: useMaterial3,
    ).copyWith(
      visualDensity: VisualDensity.standard,
      cardTheme: CardTheme(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
