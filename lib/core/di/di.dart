import 'package:get_it/get_it.dart';
import 'package:social/core/di/comments_module.dart';
import 'package:social/core/di/facebook_module.dart';
import 'package:social/core/di/stories_module.dart';
import 'package:social/core/di/tiktok_module.dart';

import 'insta_module.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  await facebookModule();
  await storiesModule();
  await instaModule();
  await tiktokModule();
  await commentsModule();
}