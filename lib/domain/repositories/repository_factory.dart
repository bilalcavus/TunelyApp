import 'package:tunely_app/core/services/api_service.dart';
import 'package:tunely_app/data/repositories_impl/chart_repository_impl.dart';
import 'package:tunely_app/data/repositories_impl/genre_repository_impl.dart';
import 'package:tunely_app/domain/repositories/chart_repository.dart';
import 'package:tunely_app/domain/repositories/genre_repository.dart';

class RepositoryFactory {
  static final RepositoryFactory _instance = RepositoryFactory._internal();
  factory RepositoryFactory() => _instance;
  RepositoryFactory._internal();

  ApiService? _apiService;
  
  ChartRepository? _chartRepository;
  GenreRepository? _genreRepository;

  ApiService get apiService => _apiService ??= ApiService();

  ChartRepository get chartRepository => _chartRepository ??= ChartRepositoryImpl(apiService: apiService);

  GenreRepository get genreRepository => _genreRepository ??= GenreRepositoryImpl(apiService: apiService);


  void clearInstance(){
    _apiService = null;
    _chartRepository = null;
    _genreRepository = null;
  }
}