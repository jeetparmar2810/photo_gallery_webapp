import 'package:flutter/material.dart';

// Dimension constants for width
class Dimens {
  // Margins and Paddings
  static const double margin_16 = 16.0;
  static const double padding_8= 8.0;

  // Width
  static const double width_4 = 4.0;

  // Spacing
  static const double spacing_8 = 8.0;

  // Screen
  static const double screenSize = 600;

  // Dynamic width based on screen size
  static double dynamicWidth(BuildContext context, double percentage) {
    return MediaQuery.of(context).size.width * percentage;
  }
}
