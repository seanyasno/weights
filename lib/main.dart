import 'package:weights/abstraction/abstractions.dart';
import 'package:flutter/material.dart';
import 'models/models.dart';
import 'pages/pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weights',
      theme: AppThemeFactory.getThemeData(context, ThemeType.DARK),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}