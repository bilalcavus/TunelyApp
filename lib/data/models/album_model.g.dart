// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Album _$AlbumFromJson(Map<String, dynamic> json) => Album(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      cover: json['cover'] as String,
      coverSmall: json['cover_small'] as String,
      coverMedium: json['cover_medium'] as String,
      coverBig: json['cover_big'] as String,
      coverXl: json['cover_xl'] as String,
      md5Image: json['md5_image'] as String,
      tracklist: json['tracklist'] as String,
      recordType: json['record_type'] as String?,
      explicitLyrics: json['explicit_lyrics'] as bool?,
      position: (json['position'] as num?)?.toInt(),
      artist: json['artist'] == null
          ? null
          : ArtistModel.fromJson(json['artist'] as Map<String, dynamic>),
      type: json['type'] as String,
    );

Map<String, dynamic> _$AlbumToJson(Album instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'cover': instance.cover,
      'cover_small': instance.coverSmall,
      'cover_medium': instance.coverMedium,
      'cover_big': instance.coverBig,
      'cover_xl': instance.coverXl,
      'md5_image': instance.md5Image,
      'record_type': instance.recordType,
      'tracklist': instance.tracklist,
      'explicit_lyrics': instance.explicitLyrics,
      'position': instance.position,
      'artist': instance.artist,
      'type': instance.type,
    };
