import 'package:json_annotation/json_annotation.dart';

part 'album_track_model.g.dart';

@JsonSerializable()
class AlbumTrackResponse {
  final List<Track> data;
  final int total;

  AlbumTrackResponse({required this.data, required this.total});

  factory AlbumTrackResponse.fromJson(Map<String, dynamic> json) =>
      _$AlbumTrackResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AlbumTrackResponseToJson(this);
}

@JsonSerializable()
class Track {
  final int id;
  final bool readable;
  final String title;
  @JsonKey(name: 'title_short')
  final String titleShort;
  @JsonKey(name: 'title_version')
  final String titleVersion;
  final String isrc;
  final String link;
  final int duration;
  @JsonKey(name: 'track_position')
  final int trackPosition;
  @JsonKey(name: 'disk_number')
  final int diskNumber;
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
  final AlbumTrackArtist artist;
  final String type;

  Track({
    required this.id,
    required this.readable,
    required this.title,
    required this.titleShort,
    required this.titleVersion,
    required this.isrc,
    required this.link,
    required this.duration,
    required this.trackPosition,
    required this.diskNumber,
    required this.rank,
    required this.explicitLyrics,
    required this.explicitContentLyrics,
    required this.explicitContentCover,
    required this.preview,
    required this.md5Image,
    required this.artist,
    required this.type,
  });

  factory Track.fromJson(Map<String, dynamic> json) => _$TrackFromJson(json);
  Map<String, dynamic> toJson() => _$TrackToJson(this);
}

@JsonSerializable()
class AlbumTrackArtist {
  final int id;
  final String name;
  final String tracklist;
  final String type;

  AlbumTrackArtist({
    required this.id,
    required this.name,
    required this.tracklist,
    required this.type,
  });

  factory AlbumTrackArtist.fromJson(Map<String, dynamic> json) =>
      _$AlbumTrackArtistFromJson(json);
  Map<String, dynamic> toJson() => _$AlbumTrackArtistToJson(this);
}
