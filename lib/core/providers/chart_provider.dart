import 'package:flutter/material.dart';
import 'package:tunely_app/core/services/api_service.dart';
import 'package:tunely_app/model/popular_artist_model.dart';
import 'package:tunely_app/model/trend_songs_model.dart';

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


  Future<void> fetchPopularArtists() async {
    _isLoading = true;
    notifyListeners();

    final response = await _apiService.fetchPopularArtists();
    if (response.data.isNotEmpty) {
      _popularArtistList = response;
      _errorMessage = null;
      _isLoading = false;
      notifyListeners();
    }
    else {
      _popularArtistList = PopularArtistList(data: []);
      _errorMessage = "No popular artists found";
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchTrendingSongs() async {
    _isLoading = true;
    notifyListeners();

    final response = await _apiService.fetchTrendingSongs();
    
    if (response.data.isNotEmpty) {
      _trendingSongs = response;
      _errorMessage = null;
      _isLoading = false;
      notifyListeners();
    }
    else {
      _trendingSongs = TrendSongsModel(0, data: []);
      _errorMessage = "No trending songs found";
      _isLoading = false;
      notifyListeners();
    }
  }
}