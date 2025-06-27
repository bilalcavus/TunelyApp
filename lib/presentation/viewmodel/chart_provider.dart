import 'package:flutter/material.dart';
import 'package:tunely_app/data/models/albums_response_model.dart';
import 'package:tunely_app/data/models/playlist_model.dart';
import 'package:tunely_app/data/models/popular_artist_model.dart';
import 'package:tunely_app/data/models/trend_songs_model.dart';
import 'package:tunely_app/domain/usecases/get_popular_artists.dart';
import 'package:tunely_app/domain/usecases/get_popular_playlists.dart';
import 'package:tunely_app/domain/usecases/get_top_albums.dart';
import 'package:tunely_app/domain/usecases/get_trending_songs.dart';

class ChartProvider extends ChangeNotifier  {
  
  final GetPopularArtists getPopularArtists;
  final GetTrendingSongs getTrendingSongs;
  final GetPopularPlaylists getPopularPlaylists;
  final GetTopAlbums getTopAlbums;

  ChartProvider(this.getPopularArtists, this.getTrendingSongs, this.getPopularPlaylists, this.getTopAlbums);

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  
  bool _isLoadingArtists = false;
  bool _isLoadingSongs = false;
  bool get isLoadingArtists => _isLoadingArtists;
  bool get isLoadingSongs => _isLoadingSongs;
  
  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  PopularArtistList? _popularArtistList;
  PopularArtistList? get popularArtists => _popularArtistList;

  TrendSongsModel? _trendingSongs;
  TrendSongsModel? get trendingSongs => _trendingSongs;

  AlbumsResponse? _topAlbums;
  AlbumsResponse? get topAlbums => _topAlbums;
  
  PlaylistsResponse? _popularPlaylists;
  PlaylistsResponse? get popularPlaylists => _popularPlaylists;

  bool _isInitialized = false;
  bool get isInitialized => _isInitialized;

  Future<void> initializeData() async {
    if (_isInitialized) return;
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      await Future.wait([
        fetchPopularArtists(),
        fetchTrendingSongs(),
        fetchTopAlbums(),
      ]);
      _isInitialized = true;
    } catch (e) {
      _errorMessage = "Veriler yüklenirken hata oluştu: \n${e.toString()}";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchPopularArtists() async {
    _isLoadingArtists = true;
    _errorMessage = null;
    notifyListeners();
    try {
      final response = await getPopularArtists();
      if (response.data.isNotEmpty) {
        _popularArtistList = response;
        _errorMessage = null;
      } else {
        _popularArtistList = PopularArtistList(data: []);
        _errorMessage = "Popüler sanatçı bulunamadı";
      }
    } catch (e) {
      _popularArtistList = PopularArtistList(data: []);
      _errorMessage = "Popüler sanatçılar yüklenirken hata oluştu: \\n${e.toString()}";
    } finally {
      _isLoadingArtists = false;
      notifyListeners();
    }
  }

  Future<void> fetchTrendingSongs() async {
    _isLoadingSongs = true;
    _errorMessage = null;
    notifyListeners();
    try {
      final response = await getTrendingSongs();
      if (response.data.isNotEmpty) {
        _trendingSongs = response;
        _errorMessage = null;
      } else {
        _trendingSongs = TrendSongsModel(data: [], total: 0);
        _errorMessage = "Trend parça bulunamadı";
      }
    } catch (e) {
      _trendingSongs = TrendSongsModel(data: [], total: 0);
      _errorMessage = "Trend parçalar yüklenirken hata oluştu: \n${e.toString()}";
    } finally {
      _isLoadingSongs = false;
      notifyListeners();
    }
  }

  Future<void> fetchPopularPlaylists() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    try {
      final response = await getPopularPlaylists();
      if (response.data.isNotEmpty) {
        _popularPlaylists = response;
        _errorMessage = null;
      } else {
        _popularPlaylists = PlaylistsResponse(data: [], total: 0);
        _errorMessage = "Popüler çalma listesi bulunamadı";
      }
    } catch (e) {
      _popularPlaylists = PlaylistsResponse(data: [], total: 0);
      _errorMessage = "Çalma listeleri yüklenirken hata oluştu: \\n${e.toString()}";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchTopAlbums() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    try {
      final response = await getTopAlbums();
      if (response.data.isNotEmpty) {
        _topAlbums = response;
        _errorMessage = null;
      } else {
        _topAlbums = AlbumsResponse(data: [], total: 0);
        _errorMessage = "Top albums bulunamadı";
      }
    } catch (e) {
      _topAlbums = AlbumsResponse(data: [], total: 0);
      _errorMessage = "Top albums yüklenirken hata oluştu: \n${e.toString()}";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }

  Future<void> refreshData() async {
    _isInitialized = false;
    await initializeData();
  }
}