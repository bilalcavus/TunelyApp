import 'package:tunely_app/data/models/album_track_model.dart';
import 'package:tunely_app/domain/repositories/chart_repository.dart';

class GetAlbumTracks {
  final ChartRepository repository;
  GetAlbumTracks(this.repository);

  Future<AlbumTrackResponse> call(int albumId){
    return repository.fetchAlbumTracks(albumId);
  }
}