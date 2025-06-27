import 'package:tunely_app/data/models/trend_songs_model.dart';
import 'package:tunely_app/domain/repositories/chart_repository.dart';

class GetTrendingSongs {
  final ChartRepository repository;

  GetTrendingSongs(this.repository);

  Future<TrendSongsModel> call(){
    return repository.fetchTrendingSongs();
  }
}