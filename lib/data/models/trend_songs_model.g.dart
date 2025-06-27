// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trend_songs_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrendSongsModel _$TrendSongsModelFromJson(Map<String, dynamic> json) =>
    TrendSongsModel(
      (json['total'] as num).toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => TrendSong.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TrendSongsModelToJson(TrendSongsModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'total': instance.total,
    };

TrendSong _$TrendSongFromJson(Map<String, dynamic> json) => TrendSong(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      titleShort: json['title_short'] as String,
      titleVersion: json['title_version'] as String,
      link: json['link'] as String,
      duration: (json['duration'] as num).toInt(),
      rank: (json['rank'] as num).toInt(),
      explicitLyrics: json['explicit_lyrics'] as bool,
      explicitContentLyrics: (json['explicit_content_lyrics'] as num).toInt(),
      explicitContentCover: (json['explicit_content_cover'] as num).toInt(),
      preview: json['preview'] as String,
      md5Image: json['md5_image'] as String,
      position: (json['position'] as num).toInt(),
      artist: ArtistModel.fromJson(json['artist'] as Map<String, dynamic>),
      album: Album.fromJson(json['album'] as Map<String, dynamic>),
      type: json['type'] as String,
    );

Map<String, dynamic> _$TrendSongToJson(TrendSong instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'title_short': instance.titleShort,
      'title_version': instance.titleVersion,
      'link': instance.link,
      'duration': instance.duration,
      'rank': instance.rank,
      'explicit_lyrics': instance.explicitLyrics,
      'explicit_content_lyrics': instance.explicitContentLyrics,
      'explicit_content_cover': instance.explicitContentCover,
      'preview': instance.preview,
      'md5_image': instance.md5Image,
      'position': instance.position,
      'artist': instance.artist,
      'album': instance.album,
      'type': instance.type,
    };
