import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tunely_app/core/theme/theme_provider.dart';
import 'package:tunely_app/view/navigation/app_navigation.dart';
import 'package:tunely_app/viewmodel/chart_provider.dart';
import 'package:tunely_app/viewmodel/genre_provider.dart';
import 'package:tunely_app/viewmodel/playlist_provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ChangeNotifierProvider(create: (_) => GenreProvider()),
      ChangeNotifierProvider(create: (_) => ChartProvider()),
      ChangeNotifierProvider(create: (_) => PlaylistProvider())
    ],
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child){
        return MaterialApp(
      title: 'Tunely App',
      theme: themeProvider.themeData,
      home: const AppNavigation(),
      );
    });
  }
}
