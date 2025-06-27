

import 'package:tunely_app/data/models/genre_model.dart';
import 'package:tunely_app/domain/repositories/base_repository.dart';

abstract class GenreRepository extends BaseRepository {
  Future<GenreList> fetchGenres();
}