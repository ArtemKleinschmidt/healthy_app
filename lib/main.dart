import 'package:daily_ui/daily_ui.dart';
import 'package:flutter/material.dart';

import 'home/home_screen.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.lightGreen,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      routeInformationProvider: _router.routeInformationProvider,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
    );
  }

  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const MyHomeScreen();
        },
        routes: [
          GoRoute(
            path: 'add_weight',
            builder: (BuildContext context, GoRouterState state) {
              return const AddWeightScreen();
            },
          ),
        ]
      ),

    ],
  );
}
