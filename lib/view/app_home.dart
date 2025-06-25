import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';
import 'package:tunely_app/core/helper/dynamic_size.dart';
import 'package:tunely_app/core/providers/chart_provider.dart';
import 'package:tunely_app/core/providers/genre_provider.dart';
import 'package:tunely_app/core/providers/playlist_provider.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_){
      final chartProvider = context.read<ChartProvider>();
      final playlistProvider = context.read<PlaylistProvider>();
      // context.read<GenreProvider>().fetchGenres();
      chartProvider.fetchPopularArtists();
      chartProvider.fetchTrendingSongs();
      playlistProvider.fetchPopularPlaylists();

    });
  }
  @override
  Widget build(BuildContext context) {
    final chartProvider = context.watch<ChartProvider>();
    final playlistProvider = context.watch<PlaylistProvider>();
    if (chartProvider.popularArtists == null && 
        chartProvider.trendingSongs == null &&
        playlistProvider.popularPlaylists == null) {
    // Veri daha yüklenmediyse bir loading gösterebiliriz
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
    return Scaffold(
      body: SingleChildScrollView(
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
              _sectionTitle(context, "Popüler Sanatçılar"),
              SizedBox(height: context.dynamicHeight(0.02)),
              _popularArtists(context, chartProvider),
              SizedBox(height: context.dynamicHeight(0.02)),
              _trendSongs(context, chartProvider),
              SizedBox(height: context.dynamicHeight(0.03)),
              _sectionTitle(context, "Popüler Çalma Listeleri"),
              SizedBox(height: context.dynamicHeight(0.01)),
              _topPlaylists(context, playlistProvider)
              // _genreGrid(genreProvider, context)
            ],
          ),
        ),
      ),
    );
  }

  SizedBox _topPlaylists(BuildContext context, PlaylistProvider playlistProvider) {
    return SizedBox(
              height: context.dynamicHeight(0.25),
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: playlistProvider.popularPlaylists!.data.length > 6 ? 6 : playlistProvider.popularPlaylists?.data.length ?? 0,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: context.dynamicHeight(0.02),
                  crossAxisSpacing: context.dynamicWidth(0.03),
                  childAspectRatio: 0.32,
                ),
                itemBuilder: (context, index){
                  final playlist = playlistProvider.popularPlaylists!.data[index];
                  return Container(
                    height: context.dynamicHeight(0.2),
                    width: context.dynamicWidth(0.5),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 231, 232, 243),
                      borderRadius: BorderRadius.circular(context.dynamicHeight(0.02)),
                      
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(context.dynamicWidth(0.02)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(context.dynamicHeight(0.01)),
                            child: Image.network(playlist.pictureMedium, fit: BoxFit.fill)),
                            SizedBox(width: context.dynamicWidth(0.02)),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(playlist.title, style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  fontSize: context.dynamicWidth(0.04),
                                  fontWeight: FontWeight.bold
                                )),
                                Text(playlist.user.name, style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontSize: context.dynamicWidth(0.035))),
                              ],
                            ),
                          ),
                          IconButton(
                          onPressed: (){},
                          icon: const Icon(HugeIcons.strokeRoundedPlayCircle,))
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
                color: const Color.fromARGB(255, 231, 232, 243),
                borderRadius: BorderRadius.all(Radius.circular(context.dynamicHeight(0.035)))
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
                    chartProvider.trendingSongs != null && chartProvider.trendingSongs!.data.isNotEmpty
                      ? ListView.builder(
                          itemCount: chartProvider.trendingSongs!.data.length > 5 ? 5 : chartProvider.trendingSongs!.data.length,
                          itemBuilder: (context, index) {
                            final song = chartProvider.trendingSongs!.data[index];
                            return ListTile(
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(song.album.coverSmall),
                              ),
                              title: Text(song.titleShort, style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontSize: context.dynamicHeight(0.02),
                                fontWeight: FontWeight.bold
                              )),
                              subtitle: Text(song.artist.name),
                              trailing: IconButton(
                                onPressed: (){},
                                icon: const Icon(HugeIcons.strokeRoundedMoreVertical) ),
                            );
                          },
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                        )
                      : const Center(child: Text("No trending songs available")),
                  ],
                ),
              ),
            );
  }

  //TODO : trend parçalar sıralaması yanlış geliyor, düzeltilecek

  SizedBox _popularArtists(BuildContext context, ChartProvider chartProvider) {
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
                          radius: context.dynamicHeight(0.05),
                          backgroundImage: NetworkImage(artist.picture),
                        ),
                        SizedBox(height: context.dynamicHeight(0.01)),
                        Text(artist.name,style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: context.dynamicWidth(0.04),),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              );
  }

  GridView _genreGrid(GenreProvider genreProvider, BuildContext context) {
    return GridView.builder(
            itemCount: genreProvider.genres!.data.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
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