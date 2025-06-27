import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:tunely_app/core/helper/dynamic_size.dart';
import 'package:tunely_app/core/theme/custom_theme_colors.dart';
import 'package:tunely_app/presentation/widgets/search_bar_widget.dart';
import 'package:tunely_app/presentation/viewmodel/chart_provider.dart';

class AppHome extends StatefulWidget {
  const AppHome({super.key});

  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  @override
  Widget build(BuildContext context) {
    final chartProvider = context.watch<ChartProvider>();
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.wait([
            chartProvider.refreshData(),
          ]);
        },
        child: SingleChildScrollView(
          child: SafeArea(
            minimum: EdgeInsets.symmetric(horizontal: context.dynamicWidth(0.02)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _homeHeader(context),
                SizedBox(height: context.dynamicHeight(0.03)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: context.dynamicWidth(0.03)),
                  child: const SearchBarWidget(hint: "Search"),
                ),
                SizedBox(height: context.dynamicHeight(0.04)),
                
                // Hata mesajları göster
                if (chartProvider.errorMessage != null)
                  _errorWidget(context, chartProvider.errorMessage!),
                if (chartProvider.errorMessage != null)
                  _errorWidget(context, chartProvider.errorMessage!),
                
                _sectionTitle(context, "Popüler Sanatçılar"),
                SizedBox(height: context.dynamicHeight(0.02)),
                _popularArtists(context, chartProvider),
                SizedBox(height: context.dynamicHeight(0.03)),
                _sectionTitle(context, "Popüler Çalma Listeleri"),
                SizedBox(height: context.dynamicHeight(0.01)),
                _topPlaylists(context, chartProvider),
                SizedBox(height: context.dynamicHeight(0.03)),
                _trendSongs(context, chartProvider),
                SizedBox(height: context.dynamicHeight(0.03)),
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

  SizedBox _topPlaylists(BuildContext context, ChartProvider chartProvider) {
    if (chartProvider.isLoading) {
      return SizedBox(
        height: context.dynamicHeight(0.25),
        child: const Center(child: CircularProgressIndicator()),
      );
    }

    if (chartProvider.popularPlaylists == null || chartProvider.popularPlaylists!.data.isEmpty) {
      return SizedBox(
        height: context.dynamicHeight(0.25),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.playlist_play, size: 50, color: Colors.grey.shade400),
              SizedBox(height: context.dynamicHeight(0.01)),
              Text(
                "Çalma listesi bulunamadı",
                style: TextStyle(color: Colors.grey.shade600),
              ),
            ],
          ),
        ),
      );
    }

    return SizedBox(
      height: context.dynamicHeight(0.25),
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: chartProvider.popularPlaylists!.data.length > 6 ? 6 : chartProvider.popularPlaylists!.data.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: context.dynamicHeight(0.02),
          crossAxisSpacing: context.dynamicWidth(0.03),
          childAspectRatio: 0.32,
        ),
        itemBuilder: (context, index){
          final playlist = chartProvider.popularPlaylists!.data[index];
          return Container(
            height: context.dynamicHeight(0.2),
            width: context.dynamicWidth(0.5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(context.dynamicHeight(0.02)),
              color: CustomThemeColors.homeContainerColor(context)
            ),
            child: Padding(
              padding: EdgeInsets.all(context.dynamicWidth(0.02)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(context.dynamicHeight(0.01)),
                    child: Image.network(
                      playlist.pictureMedium, 
                      fit: BoxFit.fill,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: 60,
                          height: 60,
                          color: Colors.grey.shade300,
                          child: Icon(Icons.music_note, color: Colors.grey.shade600),
                        );
                      },
                    ),
                  ),
                  SizedBox(width: context.dynamicWidth(0.02)),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          playlist.title, 
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: context.dynamicWidth(0.04),
                            fontWeight: FontWeight.bold
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          playlist.user.name, 
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: context.dynamicWidth(0.035)
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: (){},
                    icon: const Icon(HugeIcons.strokeRoundedPlayCircle,)
                  )
                ],
              ),
            ),
          );
        }
      ),
    );
  }

  InkWell _sectionTitle(BuildContext context, String title) {
    return InkWell(
      onTap: (){

      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.dynamicWidth(0.02)),
        child: Text(title, style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: context.dynamicWidth(0.05),
        ), textAlign: TextAlign.start),
      ),
    );
  }

  Container _trendSongs(BuildContext context, ChartProvider chartProvider) {
    return Container(
      height: context.dynamicHeight(0.53),
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(context.dynamicHeight(0.035))),
        color: CustomThemeColors.homeContainerColor(context)
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.dynamicWidth(0.03), vertical: context.dynamicHeight(0.02)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Trend Parçalar", style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: context.dynamicWidth(0.05),
            ), textAlign: TextAlign.start),
            SizedBox(height: context.dynamicHeight(0.01)),
            const Text("Bu hafta en çok dinlenen parçalar"),
            SizedBox(height: context.dynamicHeight(0.01)),
            
            if (chartProvider.isLoadingSongs)
              const Expanded(
                child: Center(child: CircularProgressIndicator()),
              )
            else if (chartProvider.trendingSongs != null && chartProvider.trendingSongs!.data.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: chartProvider.trendingSongs!.data.length > 5 ? 5 : chartProvider.trendingSongs!.data.length,
                  itemBuilder: (context, index) {
                    final song = chartProvider.trendingSongs!.data[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(song.album.coverSmall),
                        onBackgroundImageError: (exception, stackTrace) {
                          // Hata durumunda varsayılan icon göster
                        },
                        child: song.album.coverSmall.isEmpty 
                          ? Icon(Icons.music_note, color: Colors.grey.shade600)
                          : null,
                      ),
                      title: Text(
                        song.titleShort, 
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: context.dynamicHeight(0.02),
                          fontWeight: FontWeight.bold
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Text(
                        song.artist.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: IconButton(
                        onPressed: (){},
                        icon: const Icon(HugeIcons.strokeRoundedMoreVertical) 
                      ),
                    );
                  },
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                ),
              )
            else
              const Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.music_note, size: 50, color: Colors.grey),
                      SizedBox(height: 10),
                      Text("Trend parça bulunamadı"),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  SizedBox _popularArtists(BuildContext context, ChartProvider chartProvider) {
    if (chartProvider.isLoadingArtists) {
      return SizedBox(
        height: context.dynamicHeight(0.15),
        child: const Center(child: CircularProgressIndicator()),
      );
    }

    if (chartProvider.popularArtists == null || chartProvider.popularArtists!.data.isEmpty) {
      return SizedBox(
        height: context.dynamicHeight(0.15),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.person, size: 50, color: Colors.grey.shade400),
              SizedBox(height: context.dynamicHeight(0.01)),
              Text(
                "Popüler sanatçı bulunamadı",
                style: TextStyle(color: Colors.grey.shade600),
              ),
            ],
          ),
        ),
      );
    }

    return SizedBox(
      height: context.dynamicHeight(0.15),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: chartProvider.popularArtists!.data.map((artist) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: context.dynamicWidth(0.02)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: context.dynamicHeight(0.04),
                    backgroundImage: NetworkImage(artist.picture),
                    onBackgroundImageError: (exception, stackTrace) {
                      // Hata durumunda varsayılan icon göster
                    },
                    child: artist.picture.isEmpty 
                      ? Icon(Icons.person, color: Colors.grey.shade600)
                      : null,
                  ),
                  SizedBox(height: context.dynamicHeight(0.01)),
                  Text(
                    artist.name,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: context.dynamicWidth(0.04),
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            );
          }).toList(),
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
            child: const Icon(Iconsax.user),
          ),
          const Text("Location"),
          IconButton(
            onPressed: (){}, 
            icon: const Icon(Icons.notifications)
          )
        ],
      ),
    );
  }
}