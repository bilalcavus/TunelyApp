import 'package:tunely_app/core/helper/dio_helper.dart';
import 'package:tunely_app/model/genre_model.dart';
import 'package:tunely_app/model/popular_artist_model.dart';
import 'package:tunely_app/model/trend_songs_model.dart';

class ApiService{
  final DioHelper _dioHelper = DioHelper();

  Future<GenreList> fetchGenres() async {
    final response = await _dioHelper.dioGet('/genre');
    if (response is List<Map<String, dynamic>>) {
      return GenreList.fromJson({'data': response});
    }
    else if (response is Map<String, dynamic>) {
      return GenreList.fromJson(response);
    } else {
      throw Exception('Failed to load genres');
    }
  }

  Future<PopularArtistList> fetchPopularArtists() async {
    final response = await _dioHelper.dioGet('/chart');
    if (response != null && response['artists'] != null) {
      return PopularArtistList.fromJson(response['artists']);
    } else {
      throw Exception('Failed to load popular artists');
    }
  }

  Future<TrendSongsModel> fetchTrendingSongs() async {
    final response = await _dioHelper.dioGet('/chart');
    print("Response: ${response}");
    if (response != null && response['tracks'] != null) {
      return TrendSongsModel.fromJson(response['tracks']);
    }
    else {
      throw Exception('Failed to load popular artists');
    }
  }

}