import 'package:flutter/material.dart';

const ColorScheme darkColorTheme = ColorScheme(
  surface: Color.fromARGB(255, 17, 21, 38), // Use it for background
  primaryContainer: Color.fromARGB(255, 35, 33, 40), // Use it for card
  onPrimaryContainer: Color.fromARGB(255, 69, 64, 73), // Use it on card
  primary: Color.fromARGB(255, 162, 130, 232),
  secondary: Color.fromARGB(255, 242, 137, 199),
  inverseSurface: Colors.white,
  onInverseSurface: Colors.black,
  secondaryContainer: Color.fromARGB(255, 124, 132, 139),

  onPrimary: Colors.white,
  onSecondary: Colors.black,
  onSurface: Colors.white, // Light text on dark surface
  error: Colors.red,
  onError: Colors.white,
  brightness: Brightness.dark, // Indicates this is a dark theme
  onSecondaryContainer: Colors.white, // Light text on dark secondary container
  tertiary: Colors.orange,
  onTertiary: Colors.white, // Light text on dark tertiary color
  tertiaryContainer: Color(0xFFF57C00), // Darker variant of tertiary color
  onTertiaryContainer: Colors.white, // Light text on dark tertiary container
  onSurfaceVariant: Colors.white, // Light text on dark surface variant
  outline: Colors.grey, // Outline color for dark theme
  shadow: Colors.black,
  inversePrimary: Color(0xFF90CAF9), // Lighter variant of primary for dark mode
  scrim: Colors.black38, // Same scrim as light theme
);
