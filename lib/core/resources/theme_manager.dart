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
      disabledBorder: _getOutlineInputBorder(),
      enabledBorder: _getOutlineInputBorder(),
      errorBorder: _getOutlineInputBorder(),
      focusedBorder: _getOutlineInputBorder(),
      focusedErrorBorder: _getOutlineInputBorder(),
      border: _getOutlineInputBorder(),
    ),
    elevatedButtonTheme: _getMainElevatedButtonTheme(context),
  );
}

ElevatedButtonThemeData _getMainElevatedButtonTheme(BuildContext context) {
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
      textStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
    ),
  );
}

ButtonStyle getSecondaryElevatedButtonTheme({
  required BuildContext context,
  Color? backgroundColor,
  Color? foregroundColor,
}) {
  return ButtonStyle(
    padding: const WidgetStatePropertyAll(EdgeInsets.zero),
    shape: WidgetStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0), // Adjust the radius as needed
      ),
    ),
    backgroundColor: WidgetStatePropertyAll(backgroundColor ?? Theme.of(context).colorScheme.onPrimary),
    foregroundColor: WidgetStatePropertyAll(foregroundColor ?? Theme.of(context).colorScheme.primary),
    textStyle: WidgetStatePropertyAll(
        TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
        )
    ),
  );
}

OutlineInputBorder _getOutlineInputBorder({double radius = 24}) {
  return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(radius)),
      borderSide: BorderSide.none
  );
}