import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';
import 'package:tunely_app/core/helper/dynamic_size.dart';
import 'package:tunely_app/core/theme/theme_provider.dart';
import 'package:tunely_app/presentation/widgets/theme_toggle_button.dart';
import 'package:tunely_app/presentation/viewmodel/genre_provider.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    final genreProvider = context.watch<GenreProvider>();
    
    // if (!genreProvider.isInitialized) {
    //   return const Scaffold(
    //     body: Center(
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           CircularProgressIndicator(),
    //           SizedBox(height: 16),
    //           Text("Türler yükleniyor..."),
    //         ],
    //       ),
    //     ),
    //   );
    // }
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Müzik Türlerini Keşfet"),
        centerTitle: true,
        leading: ThemeSelectionButton(themeProvider: themeProvider),
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await genreProvider.refreshData();
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                if (genreProvider.errorMessage != null)
                  _errorWidget(context, genreProvider.errorMessage!),
                
                _genreGrid(genreProvider, context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _errorWidget(BuildContext context, String errorMessage) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: context.dynamicWidth(0.03), vertical: context.dynamicHeight(0.01)),
      padding: EdgeInsets.all(context.dynamicWidth(0.03)),
      decoration: BoxDecoration(
        color: Colors.red.shade100,
        borderRadius: BorderRadius.circular(context.dynamicHeight(0.01)),
        border: Border.all(color: Colors.red.shade300),
      ),
      child: Row(
        children: [
          Icon(Icons.error_outline, color: Colors.red.shade700, size: 20),
          SizedBox(width: context.dynamicWidth(0.02)),
          Expanded(
            child: Text(
              errorMessage,
              style: TextStyle(color: Colors.red.shade700, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

   Widget _genreGrid(GenreProvider genreProvider, BuildContext context) {
  if (genreProvider.isLoading) {
    return const Center(child: CircularProgressIndicator());
  }

  if (genreProvider.genres == null || genreProvider.genres!.data.isEmpty) {
    return SizedBox(
      height: context.dynamicHeight(0.6),
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.music_note, size: 50, color: Colors.grey),
            SizedBox(height: 16),
            Text("Tür bulunamadı"),
          ],
        ),
      ),
    );
  }

  return GridView.builder(
    itemCount: genreProvider.genres!.data.length,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisSpacing: context.dynamicHeight(0.015),
      crossAxisSpacing: context.dynamicWidth(0.02),
      childAspectRatio: 1.0,
    ),
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    padding: EdgeInsets.all(context.dynamicWidth(0.03)),
    itemBuilder: (context, index) {
      final genre = genreProvider.genres!.data[index];
      return ClipRRect(
        borderRadius: BorderRadius.circular(context.dynamicHeight(0.03)),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.network(
                genre.pictureMedium,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: Colors.grey.shade300,
                  child: Icon(Icons.music_note, color: Colors.grey.shade600),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(context.dynamicHeight(0.025)),
                  bottomRight: Radius.circular(context.dynamicHeight(0.025)),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.dynamicWidth(0.03),
                      vertical: context.dynamicHeight(0.015),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(genre.name, style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                          overflow: TextOverflow.ellipsis,
                        ),
                        IconButton(onPressed: (){}, icon: Icon(HugeIcons.strokeRoundedArrowRight01))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

}