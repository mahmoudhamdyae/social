import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:social/core/extensions/num_extensions.dart';
import 'package:social/features/facebook/presentaion/screens/facebook_screen.dart';
import 'package:social/features/instagram/presentaion/screens/instagram_screen.dart';
import 'package:social/features/tiktok/presentaion/screens/tiktok_screen.dart';

import '../core/resources/assets_manager.dart';

class MainScreen extends StatefulWidget {
  
  const MainScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return MainScreenState();
  }

}
class MainScreenState extends State<MainScreen> {

  final PersistentTabController _controller = PersistentTabController();

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      controller: _controller,
      tabs: [
        _buildTikTok(context),
        _buildInstagram(context),
        _buildFacebook(context),
      ],
      navBarBuilder: (navBarConfig) => Style1BottomNavBar(
        navBarConfig: navBarConfig,
        navBarDecoration: NavBarDecoration(
            padding: EdgeInsets.zero,
            color: Theme.of(context).colorScheme.surfaceContainer,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
        ),
      ),
    );
  }

  PersistentTabConfig _buildTikTok(BuildContext context) {
    return PersistentTabConfig(
      screen: const TiktokScreen(),
      item: ItemConfig(
        icon: _getActiveWidget(AssetsManager.tiktok, 'TikTok'),
        inactiveIcon: _getInActiveWidget(AssetsManager.tiktok, 'TikTok'),
      ),
    );
  }

  PersistentTabConfig _buildInstagram(BuildContext context) {
    return PersistentTabConfig(
      screen: const InstagramScreen(),
      item: ItemConfig(
        icon: _getActiveWidget(AssetsManager.instagram, 'Instagram'),
        inactiveIcon: _getInActiveWidget(AssetsManager.instagram, 'Instagram'),
      ),
    );
  }

  PersistentTabConfig _buildFacebook(BuildContext context) {
    return PersistentTabConfig(
      screen: const FacebookScreen(),
      item: ItemConfig(
        icon: _getActiveWidget(AssetsManager.facebook, 'Facebook'),
        inactiveIcon: _getInActiveWidget(AssetsManager.facebook, 'Facebook'),
      ),
    );
  }

  Column _getActiveWidget(String image, String text) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          image,
          height: 24,
          width: 24,
          color: Theme.of(context).colorScheme.secondary,
        ),
        8.ph,
        Text(
          text,
          style: _getActiveTextStyle(),
          textAlign: TextAlign.center,
        )
      ],
    );
  }

  Column _getInActiveWidget(String image, String text) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          image,
          height: 24,
          width: 24,
          color: Theme.of(context).colorScheme.primary,
        ),
        8.ph,
        Text(
          text,
          style: _getInActiveTextStyle(),
          textAlign: TextAlign.center,
        )
      ],
    );
  }

  TextStyle _getInActiveTextStyle() {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 16,
      color: Theme.of(context).colorScheme.primary,
    );
  }

  TextStyle _getActiveTextStyle() {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 16,
      color: Theme.of(context).colorScheme.secondary,
    );
  }
}