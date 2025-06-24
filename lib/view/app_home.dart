import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tunely_app/core/helper/dynamic_size.dart';
import 'package:tunely_app/core/providers/genre_provider.dart';
import 'package:tunely_app/core/widgets/search_bar_widget.dart';

class AppHome extends StatefulWidget {
  const AppHome({super.key});

  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPersistentFrameCallback((_){
      context.read<GenreProvider>().fetchGenres();
    });
  }
  @override
  Widget build(BuildContext context) {
    final genreProvider = context.watch<GenreProvider>();
    if (genreProvider.genres == null) {
    // Veri daha yüklenmediyse bir loading gösterebiliriz
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              _homeHeader(context),
              SizedBox(height: context.dynamicHeight(0.03)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: context.dynamicWidth(0.03)),
                child: const SearchBarWidget(hint: "Search"),
              ),
              SizedBox(height: context.dynamicHeight(0.04)),
              Text("Discover", style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: context.dynamicWidth(0.05),
              ), textAlign: TextAlign.start),
              SizedBox(height: context.dynamicHeight(0.04)),
              GridView.builder(
              itemCount: genreProvider.genres!.data.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: context.dynamicHeight(0.02),
                crossAxisSpacing: context.dynamicWidth(0.03),
                childAspectRatio: 1.0,
              ),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true, 
              itemBuilder: (context, index){
                final genre = genreProvider.genres!.data[index];
                return Container(
                  height: context.dynamicHeight(0.05),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(context.dynamicHeight(0.02)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.dynamicWidth(0.03),
                      vertical: context.dynamicHeight(0.01)),
                      child: Column(
                        children: [
                          Text(genre.name)
                        ],
                      ),
                    ),
                );
              }
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding _homeHeader(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal :context.dynamicHeight(0.012)),
      child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: context.dynamicHeight(0.03),
              ),
              const Text("Location"),
              Container(
                height: context.dynamicHeight(0.05),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(context.dynamicHeight(0.04))
                ),
                child: IconButton(onPressed: (){}, icon: const Icon(Icons.notifications)),
              )
            ],
          ),
    );
  }
}