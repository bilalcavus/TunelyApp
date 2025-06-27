import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tunely_app/presentation/widgets/custom_bottom_navbar.dart';
import 'package:tunely_app/presentation/view/app_home.dart';
import 'package:tunely_app/presentation/view/profile_view.dart';
import 'package:tunely_app/presentation/view/search_view.dart';
import 'package:tunely_app/presentation/viewmodel/navigation_provider.dart';

class AppNavigation extends StatelessWidget {
  const AppNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NavigationProvider(),
      child: Consumer<NavigationProvider>(
        builder: (context, navProvider, _) {
          return Scaffold(
            body: IndexedStack(
              index: navProvider.currentIndex,
              children: const [
                AppHome(),
                SearchView(),
                ProfileView()
              ],
            ),
            bottomNavigationBar: CustomBottomNavbar(
              currentIndex: navProvider.currentIndex,
              onTap: navProvider.changePage,
            ),
          );
        },
      ),
    );
  }
}