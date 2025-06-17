import 'package:flutter/material.dart';

class NavigateUtil {
  static  void navigateToScreen(BuildContext context, Widget route) {
    debugPrint('Navigating to $route');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => route),
    );
  }

  static void navigateAndClear(BuildContext context, Widget route) {
    debugPrint('Navigating and clear to $route');
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => route), (_) => false
    );
  }

  static void navigateUp(BuildContext context) {
    debugPrint('Navigating up');
    NavigateUtil.navigateUp(context);
  }
}