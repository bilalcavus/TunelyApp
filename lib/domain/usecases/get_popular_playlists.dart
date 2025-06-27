import 'package:tunely_app/data/models/playlist_model.dart';
import 'package:tunely_app/domain/repositories/chart_repository.dart';

class GetPopularPlaylists {
  final ChartRepository repository;

  GetPopularPlaylists(this.repository);

  Future<PlaylistsResponse> call(){
    return repository.fetchPopularPlaylists();
  }
}