import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'my_app.dart';
import "package:package_info_plus/package_info_plus.dart";
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await notificationPermissionDialog();
  await getPackageInfo();
  initializeDateFormatting();


  runApp(MyApp());
}

Future<void> notificationPermissionDialog() async {
  final messaging = FirebaseMessaging.instance;
  final token = await messaging.getToken();
  await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  print('Token: $token');
}

Future<void> getPackageInfo() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();

  String appName = packageInfo.appName;
  String packageName = packageInfo.packageName;
  String version = packageInfo.version;
  String buildNumber = packageInfo.buildNumber;

  print('appName: $appName');
  print('packageName: $packageName');
  print('version: $version');
  print('buildNumber: $buildNumber');
}
