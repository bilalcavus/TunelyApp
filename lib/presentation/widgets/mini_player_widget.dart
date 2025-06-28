import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tunely_app/presentation/viewmodel/audio_provider.dart';

class MiniPlayer extends StatelessWidget {
  const MiniPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    final audioProvider = context.watch<AudioProvider>();

    if (audioProvider.currentTrackTitle == null) {
      return const SizedBox(); // hiç şarkı çalmıyorsa görünmesin
    }

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.grey.shade900,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
          boxShadow: const [
            BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(0, -2))
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    audioProvider.currentTrackTitle!,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    audioProvider.isPlaying ? Icons.pause : Icons.play_arrow,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    audioProvider.play(
                      audioProvider.currentTrackTitle ?? '',
                      audioProvider.currentUrl ?? '',
                    );
                  },
                ),
          IconButton(
            icon: const Icon(Icons.close, color: Colors.white),
            onPressed: () {
              audioProvider.stop();
            },
          ),
        ],
      ),
      
      Row(
        children: [
          Text(
            _formatDuration(audioProvider.position),
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
          Expanded(
            child: Slider(
              min: 0,
              max: audioProvider.duration.inSeconds.toDouble(),
              value: audioProvider.position.inSeconds.clamp(0, 30).toDouble(),
              onChanged: (value) {
                audioProvider.seek(Duration(seconds: value.toInt()));
              },
              activeColor: Colors.white,
              inactiveColor: Colors.grey.shade600,
            ),
          ),
          Text(
            _formatDuration(audioProvider.duration),
            style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ],
            ),
          ],
        )
      ),
    );
  }

  String _formatDuration(Duration duration) {
  final minutes = duration.inMinutes.remainder(60).toString().padLeft(1, '0');
  final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
  return "$minutes:$seconds";
}
}
