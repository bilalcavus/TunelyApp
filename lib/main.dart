import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tunely_app/core/di/injection.dart';
import 'package:tunely_app/core/theme/theme_provider.dart';
import 'package:tunely_app/presentation/view/splash_view.dart';
import 'package:tunely_app/presentation/viewmodel/chart_provider.dart';
import 'package:tunely_app/presentation/viewmodel/genre_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencies();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),

        // ViewModel'leri GetIt üzerinden çek
        ChangeNotifierProvider(create: (_) => getIt<GenreProvider>()),
        ChangeNotifierProvider(create: (_) => getIt<ChartProvider>()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, _) {
        return MaterialApp(
          title: 'Tunely App',
          theme: themeProvider.themeData,
          home: const SplashView(),
        );
      },
    );
  }
}
