import 'package:flutter/material.dart';
import 'package:tunely_app/data/models/album_track_model.dart';
import 'package:tunely_app/domain/usecases/get_album_tracks.dart';

class AlbumTrackProvider extends ChangeNotifier {
  final GetAlbumTracks getAlbumTracks;

  AlbumTrackProvider(this.getAlbumTracks);

  int? _albumId;
  int? get albumId => _albumId;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  AlbumTrackResponse? _albumTracks;
  AlbumTrackResponse? get albumTracks => _albumTracks;

  AlbumTrackResponse? _totalSongs;
  AlbumTrackResponse? get totalSongs => _totalSongs;

  Future<void> fetchAlbumTracks(int albumId) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await getAlbumTracks(albumId);
      if (response.data.isNotEmpty) {
        _albumTracks = response;
        
        _errorMessage = null;
      } else {
        _albumTracks = AlbumTrackResponse(data: [], total: 0);
        _errorMessage = "Albüm şarkıları boş gibi duruyor";
      }
    } catch (e) {
      _albumTracks = AlbumTrackResponse(data: [], total: 0);
      _errorMessage = "Albüm şarkıları yüklenemedi: ${e.toString()}";
    }
    finally{
      _isLoading = false;
      notifyListeners();
    }
  }
}