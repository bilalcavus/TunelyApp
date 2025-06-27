import 'package:tunely_app/data/models/albums_response_model.dart';
import 'package:tunely_app/domain/repositories/chart_repository.dart';

class GetTopAlbums {
  final ChartRepository repository;
  GetTopAlbums(this.repository);

  Future<AlbumsResponse> call() {
    return repository.fetchTopAlbums();
  }
}