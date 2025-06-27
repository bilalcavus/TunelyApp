import 'package:flutter/material.dart';
import 'package:tunely_app/core/services/api_service.dart';
import 'package:tunely_app/data/model/popular_artist_model.dart';
import 'package:tunely_app/data/model/trend_songs_model.dart';

class ChartProvider extends ChangeNotifier  {
  
  final ApiService _apiService = ApiService();
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  
  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  PopularArtistList? _popularArtistList;
  PopularArtistList? get popularArtists => _popularArtistList;

  TrendSongsModel? _trendingSongs;
  TrendSongsModel? get trendingSongs => _trendingSongs;


  Future<void> _initializeData() async {
    await Future.wait([
      fetchPopularArtists(),
      fetchTrendingSongs(),
    ]);
  }

  Future<void> fetchPopularArtists() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await _apiService.fetchPopularArtists();
      if (response.data.isNotEmpty) {
        _popularArtistList = response;
        _errorMessage = null;
      } else {
        _popularArtistList = PopularArtistList(data: []);
        _errorMessage = "Popüler sanatçı bulunamadı";
      }
    } catch (e) {
      _popularArtistList = PopularArtistList(data: []);
      _errorMessage = "Popüler sanatçılar yüklenirken hata oluştu: ${e.toString()}";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchTrendingSongs() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await _apiService.fetchTrendingSongs();
      
      if (response.data.isNotEmpty) {
        _trendingSongs = response;
        _errorMessage = null;
      } else {
        _trendingSongs = TrendSongsModel(0, data: []);
        _errorMessage = "Trend parça bulunamadı";
      }
    } catch (e) {
      _trendingSongs = TrendSongsModel(0, data: []);
      _errorMessage = "Trend parçalar yüklenirken hata oluştu: ${e.toString()}";
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
    await _initializeData();
  }
}