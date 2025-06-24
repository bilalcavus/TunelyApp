import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tunely_app/core/providers/chart_provider.dart';
import 'package:tunely_app/core/providers/genre_provider.dart';
import 'package:tunely_app/view/app_home.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => GenreProvider()),
      ChangeNotifierProvider(create: (_) => ChartProvider()),
    ],
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tunely App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AppHome(),
    );
  }
}
