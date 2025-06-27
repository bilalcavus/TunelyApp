import 'package:json_annotation/json_annotation.dart';
import 'package:tunely_app/data/models/artist_model.dart';

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

  @JsonKey(name: 'record_type')
  final String? recordType;

  final String tracklist;
  
  @JsonKey(name: 'explicit_lyrics')
  final bool? explicitLyrics;
  final int? position;
  final ArtistModel? artist;
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
     this.recordType,
     this.explicitLyrics,
     this.position,
     this.artist,
    required this.type,
  });

  factory Album.fromJson(Map<String, dynamic> json) =>
      _$AlbumFromJson(json);
  Map<String, dynamic> toJson() => _$AlbumToJson(this);
}
