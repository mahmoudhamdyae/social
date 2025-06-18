import 'package:connectivity_monitor/connectivity_monitor.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'core/di/di.dart';
import 'firebase_options.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initAppModule();

  ConnectivityService.startConnectionNotifier(
    connectedToastMessage: "Connected!",
    disconnectedToastMessage: "No Internet Connection.",
    showToasts: true,
  );

  runApp(const MyApp());
}
