import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tunely_app/presentation/viewmodel/album_track_provider.dart';

import '../../presentation/viewmodel/audio_provider.dart';

class FullScreenPlayer extends StatelessWidget {
  const FullScreenPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    final audioProvider = context.watch<AudioProvider>();
    return DraggableScrollableSheet(
      initialChildSize: 0.95,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.drag_handle, color: Colors.white54),
              const SizedBox(height: 20),
              Container(
                height: 250,
                width: 250,
                decoration: BoxDecoration(
                  color: Colors.grey.shade800,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(Icons.music_note, size: 100, color: Colors.white30),
              ),
              const SizedBox(height: 20),
              // Şarkı bilgisi
              Text(
                audioProvider.currentTrackTitle ?? "Unknown",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),

              // Seekbar
              Slider(
                min: 0,
                max: audioProvider.duration.inSeconds.toDouble(),
                value: audioProvider.position.inSeconds.clamp(0, 30).toDouble(),
                onChanged: (value) {
                  audioProvider.seek(Duration(seconds: value.toInt()));
                },
                activeColor: Colors.white,
                inactiveColor: Colors.grey,
              ),

              // Süre göstergesi
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _formatDuration(audioProvider.position),
                    style: const TextStyle(color: Colors.white70),
                  ),
                  Text(
                    _formatDuration(audioProvider.duration),
                    style: const TextStyle(color: Colors.white70),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // Play / Pause
              IconButton(
                iconSize: 64,
                icon: Icon(
                  audioProvider.isPlaying ? Icons.pause_circle : Icons.play_circle,
                  color: Colors.white,
                ),
                onPressed: () {
                  audioProvider.play(
                    audioProvider.currentTrackTitle ?? '',
                    audioProvider.currentUrl ?? '',
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes.remainder(60).toString();
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }
}
