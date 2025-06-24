import 'package:json_annotation/json_annotation.dart';

part 'artist_model.g.dart';

@JsonSerializable()
class ArtistModel {
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
  final String type;

  ArtistModel({
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
    required this.type,
  });

  factory ArtistModel.fromJson(Map<String, dynamic> json) =>
      _$ArtistModelFromJson(json);
  Map<String, dynamic> toJson() => _$ArtistModelToJson(this);
}
