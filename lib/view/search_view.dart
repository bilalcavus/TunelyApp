import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tunely_app/core/helper/dynamic_size.dart';
import 'package:tunely_app/core/theme/theme_provider.dart';
import 'package:tunely_app/core/widgets/theme_toggle_button.dart';
import 'package:tunely_app/viewmodel/genre_provider.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final genreProvider = context.read<GenreProvider>();
      genreProvider.fetchGenres();
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    final genreProvider = context.watch<GenreProvider>();
    if(genreProvider.genres == null){
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
    return  Scaffold(
      appBar: AppBar(
        leading: ThemeSelectionButton(themeProvider: themeProvider),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: ListView(
            children: [
              Expanded(child: _genreGrid(genreProvider, context))
            ],
          ),
        ),
      )
    );
  }

   GridView _genreGrid(GenreProvider genreProvider, BuildContext context) {
    return GridView.builder(
            itemCount: genreProvider.genres!.data.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: context.dynamicHeight(0.02),
              crossAxisSpacing: context.dynamicWidth(0.03),
              childAspectRatio: 1.0,
            ),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true, 
            itemBuilder: (context, index){
              final genre = genreProvider.genres!.data[index];
              return Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(context.dynamicHeight(0.02)),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.dynamicWidth(0.03),
                    vertical: context.dynamicHeight(0.01)),
                    child: Column(
                      children: [
                        ClipRRect(
                          
                          borderRadius: BorderRadius.circular(context.dynamicHeight(0.01)),
                          child: Image.network(genre.pictureMedium, fit: BoxFit.fill)),
                      ],
                    ),
                  ),
              );
            }
            );
  }
}