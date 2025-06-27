import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:tunely_app/core/helper/route_helper.dart';
import 'package:tunely_app/presentation/view/navigation/app_navigation.dart';
import 'package:tunely_app/presentation/viewmodel/chart_provider.dart';
import 'package:tunely_app/presentation/viewmodel/genre_provider.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final chartProvider = context.read<ChartProvider>();
      final genreProvider = context.read<GenreProvider>();
      genreProvider.initializeData();
      chartProvider.initializeData();
    });
    _navigateToApp();
  }

  void _navigateToApp() async {
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) {
      RouteHelper.pushAndCloseOther(context, const AppNavigation());
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset("assets/lottie/splash_lottie.json",
              height: 150
            ),
            const SizedBox(height: 50),
            Text('Tunely', style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            )),
            
          ],
        ),
      ),
    );
  }
}