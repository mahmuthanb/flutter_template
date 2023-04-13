import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light() => FlexThemeData.light(scheme: FlexScheme.mandyRed);
  static ThemeData dark() => FlexThemeData.dark(scheme: FlexScheme.mandyRed);
}
