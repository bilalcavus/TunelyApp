import 'package:flutter/material.dart';
import 'package:tunely_app/core/services/api_service.dart';
import 'package:tunely_app/data/model/playlist_model.dart';

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
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await _apiService.fetchPopularPlaylists();
      if (response.data.isNotEmpty) {
        _popularPlaylists = response;
        _errorMessage = null;
      } else {
        _popularPlaylists = PlaylistsResponse(data: [], total: 0);
        _errorMessage = "Popüler çalma listesi bulunamadı";
      }
    } catch (e) {
      _popularPlaylists = PlaylistsResponse(data: [], total: 0);
      _errorMessage = "Çalma listeleri yüklenirken hata oluştu: ${e.toString()}";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Hata mesajını temizle
  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }

  // Verileri yenile
  Future<void> refreshData() async {
    await fetchPopularPlaylists();
  }
}