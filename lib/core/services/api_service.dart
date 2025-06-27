import 'package:tunely_app/core/helper/dio_helper.dart';
import 'package:tunely_app/data/model/genre_model.dart';
import 'package:tunely_app/data/model/playlist_model.dart';
import 'package:tunely_app/data/model/popular_artist_model.dart';
import 'package:tunely_app/data/model/trend_songs_model.dart';

class ApiService{
  final DioHelper _dioHelper = DioHelper();

  Future<GenreList> fetchGenres() async {
    try {
      final response = await _dioHelper.dioGet('/genre');
      
      if (response is Map<String, dynamic> && response.containsKey('error')) {
        throw Exception(response['error']);
      }
      
      if (response is List<Map<String, dynamic>>) {
        return GenreList.fromJson({'data': response});
      }
      else if (response is Map<String, dynamic>) {
        return GenreList.fromJson(response);
      } else {
        throw Exception('Geçersiz veri formatı');
      }
    } catch (e) {
      throw Exception('Türler yüklenirken hata oluştu: ${e.toString()}');
    }
  }

  Future<PopularArtistList> fetchPopularArtists() async {
    try {
      final response = await _dioHelper.dioGet('/chart');
      
      if (response is Map<String, dynamic> && response.containsKey('error')) {
        throw Exception(response['error']);
      }
      
      if (response != null && response['artists'] != null) {
        return PopularArtistList.fromJson(response['artists']);
      } else {
        throw Exception('Popüler sanatçı verisi bulunamadı');
      }
    } catch (e) {
      throw Exception('Popüler sanatçılar yüklenirken hata oluştu: ${e.toString()}');
    }
  }

  Future<TrendSongsModel> fetchTrendingSongs() async {
    try {
      final response = await _dioHelper.dioGet('/chart');
      
      if (response is Map<String, dynamic> && response.containsKey('error')) {
        throw Exception(response['error']);
      }
      
      if (response != null && response['tracks'] != null) {
        return TrendSongsModel.fromJson(response['tracks']);
      }
      else {
        throw Exception('Trend parça verisi bulunamadı');
      }
    } catch (e) {
      throw Exception('Trend parçalar yüklenirken hata oluştu: ${e.toString()}');
    }
  }

  Future<PlaylistsResponse> fetchPopularPlaylists() async {
    try {
      final response = await _dioHelper.dioGet('/chart');
      
      if (response is Map<String, dynamic> && response.containsKey('error')) {
        throw Exception(response['error']);
      }
      
      if (response != null && response['playlists'] != null) {
        return PlaylistsResponse.fromJson(response['playlists']);
      }
      else {
        throw Exception('Popüler çalma listesi verisi bulunamadı');
      }
    } catch (e) {
      throw Exception('Popüler çalma listeleri yüklenirken hata oluştu: ${e.toString()}');
    }
  }
}