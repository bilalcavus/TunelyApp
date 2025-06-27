import 'package:tunely_app/data/models/popular_artist_model.dart';
import 'package:tunely_app/domain/repositories/chart_repository.dart';

class GetPopularArtists{
  final ChartRepository repository;

  GetPopularArtists(this.repository);

  Future<PopularArtistList> call(){
    return repository.fetchPopularArtists();
  }
}