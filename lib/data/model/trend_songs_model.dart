
import 'package:json_annotation/json_annotation.dart';
import 'package:tunely_app/data/model/album_model.dart';
import 'package:tunely_app/data/model/artist_model.dart';

part 'trend_songs_model.g.dart';

@JsonSerializable()
class TrendSongsModel {
  final List<TrendSong> data;
  final int total;

  TrendSongsModel(this.total, {required this.data});

  factory TrendSongsModel.fromJson(Map<String, dynamic> json) => _$TrendSongsModelFromJson(json);
  Map<String, dynamic> toJson() => _$TrendSongsModelToJson(this);
}

@JsonSerializable()
  class TrendSong{
    final int id;
  final String title;

  @JsonKey(name: 'title_short')
  final String titleShort;

  @JsonKey(name: 'title_version')
  final String titleVersion;

  final String link;
  final int duration;
  final int rank;

  @JsonKey(name: 'explicit_lyrics')
  final bool explicitLyrics;

  @JsonKey(name: 'explicit_content_lyrics')
  final int explicitContentLyrics;

  @JsonKey(name: 'explicit_content_cover')
  final int explicitContentCover;

  final String preview;

  @JsonKey(name: 'md5_image')
  final String md5Image;

  final int position;
  final ArtistModel artist;
  final Album album;
  final String type;


  TrendSong({
    required this.id,
    required this.title,
    required this.titleShort,
    required this.titleVersion,
    required this.link,
    required this.duration,
    required this.rank,
    required this.explicitLyrics,
    required this.explicitContentLyrics,
    required this.explicitContentCover,
    required this.preview,
    required this.md5Image,
    required this.position,
    required this.artist,
    required this.album,
    required this.type,
  });

    factory TrendSong.fromJson(Map<String, dynamic> json) => _$TrendSongFromJson(json);
    Map<String, dynamic> toJson() => _$TrendSongToJson(this);
  }