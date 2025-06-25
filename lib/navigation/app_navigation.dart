import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tunely_app/core/providers/navigation_provider.dart';
import 'package:tunely_app/core/widgets/custom_bottom_navbar.dart';
import 'package:tunely_app/view/app_home.dart';
import 'package:tunely_app/view/search_view.dart';

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
                SearchView()
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