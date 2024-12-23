import 'package:flutter/material.dart';
import 'light_color_theme.dart';
import 'dark_color_theme.dart';

final ThemeData lightTheme = ThemeData(
  colorScheme: lightColorTheme,
  fontFamily: 'Gilroy',
  useMaterial3: true,
  navigationBarTheme: const NavigationBarThemeData(
    indicatorColor: Colors.transparent,
    labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
  ),
);

final ThemeData darkTheme = ThemeData(
  colorScheme: darkColorTheme,
  fontFamily: 'Gilroy',
  useMaterial3: true,
  navigationBarTheme: const NavigationBarThemeData(
    indicatorColor: Colors.transparent,
    labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
  ),
);
