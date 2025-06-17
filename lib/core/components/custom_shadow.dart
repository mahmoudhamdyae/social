import 'package:flutter/material.dart';

List<BoxShadow> customSubBoxShadow({
  Color? color,
  double blurRadius = 12.0,
  double spreadRadius = 0.0,
  Offset offset = const Offset(1, 1),
  required BuildContext context
}) {
  return [
    BoxShadow(
      color: color ?? Theme.of(context).colorScheme.shadow.withValues(alpha: .1),
      offset: offset,
      blurRadius: blurRadius,
      spreadRadius: spreadRadius,
    ),
  ];
}

List<BoxShadow> customMainBoxShadow({
  Color? color,
  double blurRadius = 12.0,
  double spreadRadius = 0.0,
  Offset offset = const Offset(1, 1),
  required BuildContext context
}) {
  return [
    BoxShadow(
        color: Theme.of(context).colorScheme.primary.withValues(alpha: .12),
        spreadRadius: 1,
        blurRadius: 12,
        offset: const Offset(1, 1)
    )
  ];
}

List<BoxShadow> navBarShadow({
  Color? color,
  double blurRadius = 12.0,
  double spreadRadius = 1.0,
  Offset offset = const Offset(1, 1),
  required BuildContext context
}) {
  return [
    BoxShadow(
      color: color ?? Theme.of(context).colorScheme.primary.withValues(alpha: .4),
      offset: offset,
      blurRadius: blurRadius,
      spreadRadius: spreadRadius,
    ),
  ];
}