import 'package:json_annotation/json_annotation.dart';

part 'album_model.g.dart';

@JsonSerializable()
class Album {
  final int id;
  final String title;
  final String cover;

  @JsonKey(name: 'cover_small')
  final String coverSmall;

  @JsonKey(name: 'cover_medium')
  final String coverMedium;

  @JsonKey(name: 'cover_big')
  final String coverBig;

  @JsonKey(name: 'cover_xl')
  final String coverXl;

  @JsonKey(name: 'md5_image')
  final String md5Image;

  final String tracklist;
  final String type;

  Album({
    required this.id,
    required this.title,
    required this.cover,
    required this.coverSmall,
    required this.coverMedium,
    required this.coverBig,
    required this.coverXl,
    required this.md5Image,
    required this.tracklist,
    required this.type,
  });

  factory Album.fromJson(Map<String, dynamic> json) =>
      _$AlbumFromJson(json);
  Map<String, dynamic> toJson() => _$AlbumToJson(this);
}
