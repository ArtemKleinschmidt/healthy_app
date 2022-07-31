import 'package:flutter/material.dart';
import 'package:healthy_app/features/charts/presentation/charts_screen.dart';
import 'package:healthy_app/features/daily/presentation/daily_screen.dart';
import 'package:healthy_app/features/info/presentation/info_screen.dart';
import 'package:healthy_app/features/more/presentation/more_screen.dart';

import 'home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.lightBlue,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
      ),
      home: const MyHomePage(),
    );
  }
}


