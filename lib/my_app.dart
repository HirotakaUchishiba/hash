import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hash/top/top_page.dart';
import 'landing_page.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final bool isLogin = FirebaseAuth.instance.currentUser != null;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.grey.shade100,
      ),
      //ここでログイン情報の有無を見る
      home: isLogin ? TopPage() : LandingPage()
    );
  }
}
