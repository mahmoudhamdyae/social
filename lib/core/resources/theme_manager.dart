import 'package:flutter/material.dart';
import 'package:social/core/resources/theme.dart';

late ThemeData globalTheme;
ThemeData getApplicationTheme(BuildContext context) {
  return ThemeData(
    colorScheme: lightScheme(),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 12,
      ),
      filled: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      disabledBorder: _getOutlineInputBorder(8),
      enabledBorder: _getOutlineInputBorder(8),
      errorBorder: _getOutlineInputBorder(8),
      focusedBorder: _getOutlineInputBorder(8),
      focusedErrorBorder: _getOutlineInputBorder(8),
      border: _getOutlineInputBorder(8),
    ),
  );
}

OutlineInputBorder _getOutlineInputBorder(double radius) {
  return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(radius)),
      borderSide: BorderSide()
  );
}