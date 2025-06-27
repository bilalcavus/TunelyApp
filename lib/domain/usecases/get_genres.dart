import 'package:tunely_app/data/models/genre_model.dart';
import 'package:tunely_app/domain/repositories/genre_repository.dart';

class GetGenres {
  final GenreRepository repository;
  GetGenres(this.repository);

  Future<GenreList> getGenres(){
    return repository.fetchGenres();
  }
}