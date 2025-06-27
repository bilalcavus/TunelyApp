import 'package:tunely_app/core/error/error_handler.dart';
import 'package:tunely_app/core/services/api_service.dart';
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
      operation: () => _apiService.fetchTrendingSongs(),
      errorMessage: 'Fetching trending songs are failed'
    );
  }

  @override
  Future<PlaylistsResponse> fetchPopularPlaylists() {
    return handleRepositoryOperation(operation: () => _apiService.fetchPopularPlaylists());
  }
}