import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:tunely_app/core/helper/dynamic_size.dart';
import 'package:tunely_app/core/theme/custom_theme_colors.dart';
import 'package:tunely_app/presentation/viewmodel/album_track_provider.dart';
import 'package:tunely_app/presentation/viewmodel/audio_provider.dart';
import 'package:tunely_app/presentation/widgets/full_screen_player.dart';
import 'package:tunely_app/presentation/widgets/mini_player_widget.dart';

class AlbumDetailView extends StatefulWidget {
  const AlbumDetailView({super.key, required this.albumId, required this.album});

  final int albumId;
  final dynamic album;

  @override
  State<AlbumDetailView> createState() => _AlbumDetailViewState();
}

class _AlbumDetailViewState extends State<AlbumDetailView> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      final albumTrackProvider = context.read<AlbumTrackProvider>();
      albumTrackProvider.fetchAlbumTracks(widget.albumId);
    });
  }
  
  @override
  Widget build(BuildContext context) {
    final albumTrackProvider = context.watch<AlbumTrackProvider>();
    final albumTotalSongs = albumTrackProvider.albumTracks?.total;
    
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Column(
          children: [
            Padding(
              padding: EdgeInsets.all(context.dynamicHeight(0.03)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(widget.album.cover)),
                    SizedBox(width: context.dynamicWidth(0.05)),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.album.title, style: TextStyle(
                          fontSize: context.dynamicWidth(0.05),
                          fontWeight: FontWeight.bold)),
                          Text(widget.album.artist.name),
                          Text("$albumTotalSongs songs", textAlign: TextAlign.center),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: context.dynamicHeight(0.03)),
            albumTracksList(context, albumTrackProvider),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: InkWell(
              onTap: (){
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (_) =>  FullScreenPlayer()
                );
              },
              child: const MiniPlayer()),
          )
        ],
      ),
    );
  }

  Widget albumTracksList(BuildContext context, AlbumTrackProvider provider){
    if (provider.isLoading){
      return SizedBox(
              height: context.dynamicHeight(0.25),
              child: const Center(child: CircularProgressIndicator()),
            );
    }
    if(provider.albumTracks == null || provider.albumTracks!.data.isEmpty){
      return SizedBox(
              height: context.dynamicHeight(0.25),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.playlist_play, size: 50, color: Colors.grey.shade400),
                    SizedBox(height: context.dynamicHeight(0.01)),
                    Text("topAlbums listesi bulunamadı",
                      style: TextStyle(color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),
          );
    }
    return Expanded(
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: context.dynamicWidth(0.04)),
        child: SizedBox(
                height: context.dynamicHeight(0.25),
                child: ListView.builder(
                  padding: EdgeInsets.only(bottom: context.dynamicHeight(0.1)),
                  itemCount: provider.albumTracks!.data.length,
                  itemBuilder: (context, index){
                    final albumTrack = provider.albumTracks!.data[index];
                    return InkWell(
                      onTap: ()  {
                        context.read<AudioProvider>().play(
                          albumTrack.title,
                          albumTrack.preview);
                      },
                      child: ListTile(
                        title: Text(albumTrack.title),
                        leading: Container(
                          height: context.dynamicHeight(0.04),
                          width: context.dynamicWidth(0.09),
                          decoration: BoxDecoration(
                            color: CustomThemeColors.albumTrackIconContainer(context),
                            borderRadius: BorderRadius.circular(16)
                          ),
                          child: Icon(Iconsax.music, color: CustomThemeColors.albumTrackIcon(context),)),
                        
                      ),
                    );
                  }),
              ),
      ),
    );
  }
}