import 'package:json_annotation/json_annotation.dart';

part 'popular_artist_model.g.dart';

@JsonSerializable()
class PopularArtistList {
  final List<Artist> data;

  PopularArtistList({required this.data});

  factory PopularArtistList.fromJson(Map<String, dynamic> json) => _$PopularArtistListFromJson(json);
  Map<String, dynamic> toJson() => _$PopularArtistListToJson(this);
}

@JsonSerializable()
class Artist {
  final int id;
  final String name;
  final String link;
  final String picture;

  @JsonKey(name: 'picture_small')
  final String pictureSmall;

  @JsonKey(name: 'picture_medium')
  final String pictureMedium;

  @JsonKey(name: 'picture_big')
  final String pictureBig;

  @JsonKey(name: 'picture_xl')
  final String pictureXl;

  final bool radio;
  final String tracklist;
  final int position;
  final String type;

  Artist({
    required this.id,
    required this.name,
    required this.link,
    required this.picture,
    required this.pictureSmall,
    required this.pictureMedium,
    required this.pictureBig,
    required this.pictureXl,
    required this.radio,
    required this.tracklist,
    required this.position,
    required this.type,
  });

  factory Artist.fromJson(Map<String, dynamic> json) => _$ArtistFromJson(json);
  Map<String, dynamic> toJson() => _$ArtistToJson(this);
}
