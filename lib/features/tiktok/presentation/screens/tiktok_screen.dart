import 'package:flutter/material.dart';
import 'package:social/features/tiktok/presentation/screens/tiktok_item.dart';
import 'package:tiktoklikescroller/tiktoklikescroller.dart';

class TiktokScreen extends StatelessWidget {
  const TiktokScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Color> colors = <Color>[Colors.red, Colors.blue, Colors.green];
    final Controller controller = Controller()..addListener((event) {
    _handleCallbackEvent(event.direction, event.success);
    });
    return TikTokStyleFullPageScroller(
      contentSize: colors.length,
      swipePositionThreshold: 0.2,
      // ^ the fraction of the screen needed to scroll
      swipeVelocityThreshold: 2000,
      // ^ the velocity threshold for smaller scrolls
      animationDuration: const Duration(milliseconds: 400),
      // ^ how long the animation will take
      controller: controller,
      // ^ registering our own function to listen to page changes
      builder: (BuildContext context, int index) {
        return TiktokItem();
      },
    );
  }

  void _handleCallbackEvent(ScrollDirection direction, ScrollSuccess success,
      {int? currentIndex}) {
    debugPrint("Scroll callback received with data: {direction: $direction, success: $success and index: ${currentIndex ?? 'not given'}}");
  }
}
