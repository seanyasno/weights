import 'package:weights/abstraction/abstractions.dart';
import 'package:weights/providers/providers.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'models/models.dart';
import 'pages/pages.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: WeightsDataProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weights',
      theme: AppThemeFactory.getThemeData(context, ThemeType.DARK),
      home: WeightsPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
