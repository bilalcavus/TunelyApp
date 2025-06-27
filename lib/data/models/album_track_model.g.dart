// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_track_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlbumTrackResponse _$AlbumTrackResponseFromJson(Map<String, dynamic> json) =>
    AlbumTrackResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => Track.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$AlbumTrackResponseToJson(AlbumTrackResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'total': instance.total,
    };

Track _$TrackFromJson(Map<String, dynamic> json) => Track(
      id: (json['id'] as num).toInt(),
      readable: json['readable'] as bool,
      title: json['title'] as String,
      titleShort: json['title_short'] as String,
      titleVersion: json['title_version'] as String,
      isrc: json['isrc'] as String,
      link: json['link'] as String,
      duration: (json['duration'] as num).toInt(),
      trackPosition: (json['track_position'] as num).toInt(),
      diskNumber: (json['disk_number'] as num).toInt(),
      rank: (json['rank'] as num).toInt(),
      explicitLyrics: json['explicit_lyrics'] as bool,
      explicitContentLyrics: (json['explicit_content_lyrics'] as num).toInt(),
      explicitContentCover: (json['explicit_content_cover'] as num).toInt(),
      preview: json['preview'] as String,
      md5Image: json['md5_image'] as String,
      artist: AlbumTrackArtist.fromJson(json['artist'] as Map<String, dynamic>),
      type: json['type'] as String,
    );

Map<String, dynamic> _$TrackToJson(Track instance) => <String, dynamic>{
      'id': instance.id,
      'readable': instance.readable,
      'title': instance.title,
      'title_short': instance.titleShort,
      'title_version': instance.titleVersion,
      'isrc': instance.isrc,
      'link': instance.link,
      'duration': instance.duration,
      'track_position': instance.trackPosition,
      'disk_number': instance.diskNumber,
      'rank': instance.rank,
      'explicit_lyrics': instance.explicitLyrics,
      'explicit_content_lyrics': instance.explicitContentLyrics,
      'explicit_content_cover': instance.explicitContentCover,
      'preview': instance.preview,
      'md5_image': instance.md5Image,
      'artist': instance.artist,
      'type': instance.type,
    };

AlbumTrackArtist _$AlbumTrackArtistFromJson(Map<String, dynamic> json) =>
    AlbumTrackArtist(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      tracklist: json['tracklist'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$AlbumTrackArtistToJson(AlbumTrackArtist instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'tracklist': instance.tracklist,
      'type': instance.type,
    };
