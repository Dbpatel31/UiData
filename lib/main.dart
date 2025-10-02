import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uipractice/AboutView.dart';
import 'package:uipractice/ChatScreen.dart';
import 'package:uipractice/DashboardScreen.dart';
import 'package:uipractice/HomePage.dart';
import 'package:uipractice/MusicPlayerScreen.dart';
import 'package:uipractice/ProductScreen.dart';
import 'package:uipractice/ProfileView.dart';

import 'WhatAppChatScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: AboutView(),
    );
  }
}
