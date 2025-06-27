import 'package:tunely_app/core/error/error_handler.dart';
import 'package:tunely_app/core/services/api_service.dart';
import 'package:tunely_app/data/models/album_track_model.dart';
import 'package:tunely_app/data/models/albums_response_model.dart';
import 'package:tunely_app/data/models/playlist_model.dart';
import 'package:tunely_app/data/models/popular_artist_model.dart';
import 'package:tunely_app/data/models/trend_songs_model.dart';
import 'package:tunely_app/domain/repositories/chart_repository.dart';

class ChartRepositoryImpl implements ChartRepository {
  final ApiService _apiService;

  ChartRepositoryImpl({ApiService? apiService}) : _apiService = apiService ?? ApiService();

  @override
  Future<T> handleRepositoryOperation<T>({required Future<T> Function() operation, String? errorMessage}) async {
    try {
      return await operation();
    } catch (e) {
      if (e is AppError) {
        rethrow;
      }
      throw AppError(
        message: errorMessage ?? 'Repository operation failed',
        type: ErrorType.unknown,
        originalError: e,
      );
    }
  }

  @override
  Future<PopularArtistList> fetchPopularArtists() {
    return handleRepositoryOperation(
      operation: () => _apiService.fetchPopularArtists(),
      errorMessage: 'Popular artist fetching failed.'
    );
  }

  @override
  Future<TrendSongsModel> fetchTrendingSongs() {
    return handleRepositoryOperation(
      operation: () async {
        try {
          final result = await _apiService.fetchTrendingSongs();
          return result;
        } catch (e) {
          rethrow;
        }
      },
      errorMessage: 'Fetching trending songs are failed'
    );
  }

  @override
  Future<PlaylistsResponse> fetchPopularPlaylists() {
    return handleRepositoryOperation(operation: () => _apiService.fetchPopularPlaylists());
  }

  @override
  Future<AlbumsResponse> fetchTopAlbums() {
    return handleRepositoryOperation(operation: () => _apiService.fetchTopAlbums());
  }

  @override
  Future<AlbumTrackResponse> fetchAlbumTracks(int albumId) {
    return handleRepositoryOperation(operation: () => _apiService.fetchAlbumTracks(albumId));
  }
}