import 'package:flutter/material.dart';
import 'package:tunely_app/core/services/api_service.dart';
import 'package:tunely_app/model/playlist_model.dart';

class PlaylistProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  PlaylistsResponse? _popularPlaylists;
  PlaylistsResponse? get popularPlaylists => _popularPlaylists;

  Future<void> fetchPopularPlaylists() async {
    _isLoading = true;
    notifyListeners();

    final response = await _apiService.fetchPopularPlaylists();
    if (response.data.isNotEmpty) {
      _popularPlaylists = response;
      _errorMessage = null;
      _isLoading = false;
      notifyListeners();
    }
    else {
      _popularPlaylists = PlaylistsResponse(data: [], total: 0);
      _errorMessage = "No playlists found";
      _isLoading = false;
      notifyListeners();
    }
  }
}