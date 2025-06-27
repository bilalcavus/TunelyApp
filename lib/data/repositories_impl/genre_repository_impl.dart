import 'package:tunely_app/core/error/error_handler.dart';
import 'package:tunely_app/core/services/api_service.dart';
import 'package:tunely_app/data/models/genre_model.dart';
import 'package:tunely_app/domain/repositories/genre_repository.dart';

class GenreRepositoryImpl implements GenreRepository {
  final ApiService _apiService;

  GenreRepositoryImpl({ApiService? apiService}) : _apiService = apiService ?? ApiService();

  

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
        originalError: e);
    }
  }

  @override
  Future<GenreList> fetchGenres() {
    return handleRepositoryOperation(
      operation: () => _apiService.fetchGenres(),
      errorMessage: 'Failed fetching genres'
    );
  }
}