import 'package:tunely_app/data/models/playlist_model.dart';
import 'package:tunely_app/data/models/popular_artist_model.dart';
import 'package:tunely_app/data/models/trend_songs_model.dart';
import 'package:tunely_app/domain/repositories/base_repository.dart';

abstract class ChartRepository extends BaseRepository {
  Future<PopularArtistList> fetchPopularArtists();

  Future<TrendSongsModel> fetchTrendingSongs();

  Future<PlaylistsResponse> fetchPopularPlaylists();
}