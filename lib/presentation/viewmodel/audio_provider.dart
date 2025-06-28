import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioProvider extends ChangeNotifier {
  final AudioPlayer _audioPlayer = AudioPlayer();

  AudioProvider() {
  _audioPlayer.onPositionChanged.listen((pos) {
    _position = pos;
    notifyListeners();
  });

  _audioPlayer.onPlayerComplete.listen((event) {
    _isPlaying = false;
    _position = Duration.zero;
    notifyListeners();
  });
}

Future<void> seek(Duration newPosition) async {
  await _audioPlayer.seek(newPosition);
}


  String? _currentTrackTitle;
  String? _currentUrl;
  String? get currentUrl => _currentUrl;
  bool _isPlaying = false;

  String? get currentTrackTitle => _currentTrackTitle;
  bool get isPlaying => _isPlaying;

  Duration _position = Duration.zero;
  final Duration _duration = const Duration(seconds: 30);

  Duration get position => _position;
  Duration get duration => _duration;

  Future<void> play(String title, String url) async {
    if (_currentUrl != url) {
      await _audioPlayer.stop();
      _currentUrl = url;
      _currentTrackTitle = title;
      await _audioPlayer.play(UrlSource(url));
    } else {
      if (_isPlaying) {
        await _audioPlayer.pause();
      } else {
        await _audioPlayer.resume();
      }
    }

    _isPlaying = !_isPlaying;
    notifyListeners();
  }

  void stop() async {
    await _audioPlayer.stop();
    _isPlaying = false;
    _currentTrackTitle = null;
    notifyListeners();
  }
}
