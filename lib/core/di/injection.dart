import 'package:get_it/get_it.dart';
import 'package:tunely_app/core/helper/dio_helper.dart';
import 'package:tunely_app/data/repositories_impl/chart_repository_impl.dart';
import 'package:tunely_app/data/repositories_impl/genre_repository_impl.dart';
// DataSources


// Repositories
import 'package:tunely_app/domain/repositories/chart_repository.dart';
import 'package:tunely_app/domain/repositories/genre_repository.dart';
// Usecases
import 'package:tunely_app/domain/usecases/get_popular_artists.dart';
import 'package:tunely_app/domain/usecases/get_popular_playlists.dart';
import 'package:tunely_app/domain/usecases/get_trending_songs.dart';
import 'package:tunely_app/presentation/viewmodel/chart_provider.dart';
// ViewModels
import 'package:tunely_app/presentation/viewmodel/genre_provider.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  // Core
  getIt.registerLazySingleton<DioHelper>(() => DioHelper());

  // DataSources
  // getIt.registerLazySingleton<ChartRemoteDataSource>(() => ChartRemoteDataSourceImpl(getIt()));
  // getIt.registerLazySingleton<GenreRemoteDataSource>(() => GenreRemoteDataSourceImpl(getIt()));
  // getIt.registerLazySingleton<PlaylistRemoteDataSource>(() => PlaylistRemoteDataSourceImpl(getIt()));

  // Repositories
  getIt.registerLazySingleton<ChartRepository>(() => ChartRepositoryImpl());
  getIt.registerLazySingleton<GenreRepository>(() => GenreRepositoryImpl());
  // PlaylistRepository de gerekiyorsa ekle

  // UseCases
  getIt.registerLazySingleton<GetPopularArtists>(() => GetPopularArtists(getIt()));
  getIt.registerLazySingleton<GetTrendingSongs>(() => GetTrendingSongs(getIt()));
  getIt.registerLazySingleton<GetPopularPlaylists>(() => GetPopularPlaylists(getIt()));

  // getIt.registerLazySingleton<GetGenres>(() => GetGenres(getIt()));
  // getIt.registerLazySingleton<GetPopularPlaylists>(() => GetPopularPlaylists(getIt()));

  // ViewModels
  getIt.registerFactory(() => ChartProvider(getIt(), getIt(), getIt()));
  getIt.registerFactory(() => GenreProvider());
  // getIt.registerFactory(() => PlaylistViewModel(getIt()));
}
