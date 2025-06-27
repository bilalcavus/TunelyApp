import 'package:json_annotation/json_annotation.dart';

part 'genre_model.g.dart';

@JsonSerializable()
class GenreList {
  final List<Genre> data;

  GenreList({required this.data});

  factory GenreList.fromJson(Map<String, dynamic> json) => _$GenreListFromJson(json);
  Map<String, dynamic> toJson() => _$GenreListToJson(this);
}

@JsonSerializable()
class Genre {
  final int id;
  final String name;
  final String picture;

  @JsonKey(name: 'picture_small')
  final String pictureSmall;

  @JsonKey(name: 'picture_medium')
  final String pictureMedium;

  @JsonKey(name: 'picture_big')
  final String pictureBig;

  @JsonKey(name: 'picture_xl')
  final String pictureXl;

  final String type;

  Genre({
    required this.id,
    required this.name,
    required this.picture,
    required this.pictureSmall,
    required this.pictureMedium,
    required this.pictureBig,
    required this.pictureXl,
    required this.type,
  });

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);
  Map<String, dynamic> toJson() => _$GenreToJson(this);
}
