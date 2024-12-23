import 'package:flutter/material.dart';

const ColorScheme lightColorTheme = ColorScheme(
  surface: Color.fromARGB(255, 228, 229, 238), // Use it for backgrounds
  primaryContainer: Colors.white, // Use it for card
  onPrimaryContainer: Color.fromARGB(255, 239, 238, 240), // Use it on card
  primary: Color.fromARGB(255, 162, 130, 232),
  secondary: Color.fromARGB(255, 242, 137, 199),
  inverseSurface: Colors.black,
  onInverseSurface: Colors.white,
  secondaryContainer: Color.fromARGB(255, 93, 95, 96),

  onPrimary: Colors.white, // Light text on blue primary
  onSecondary: Colors.black, // Dark text on green secondary
  onSurface: Colors.black, // Dark text on light surface
  error: Colors.red, // Error color remains the same
  onError: Colors.white, // Light text on error
  brightness: Brightness.light, // Indicates this is a light theme
  onSecondaryContainer: Colors.black, // Dark text on light secondary container
  tertiary: Colors.orange,
  onTertiary: Colors.white, // Light text on orange tertiary
  tertiaryContainer: Color(0xFFFFE0B2), // Lighter variant of tertiary color
  onTertiaryContainer: Colors.black, // Dark text on light tertiary container
  onSurfaceVariant: Colors.black, // Dark text on light surface variant
  outline: Colors.grey, // Outline color for light theme
  shadow: Colors.black12, // Lighter shadow color for light surfaces
  inversePrimary: Color(0xFF1976D2), // Darker primary for inverse situations
  scrim: Colors.black, // Same scrim as dark theme for modals
);
