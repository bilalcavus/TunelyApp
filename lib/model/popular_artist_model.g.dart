// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_artist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PopularArtistList _$PopularArtistListFromJson(Map<String, dynamic> json) =>
    PopularArtistList(
      data: (json['data'] as List<dynamic>)
          .map((e) => Artist.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PopularArtistListToJson(PopularArtistList instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

Artist _$ArtistFromJson(Map<String, dynamic> json) => Artist(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      link: json['link'] as String,
      picture: json['picture'] as String,
      pictureSmall: json['picture_small'] as String,
      pictureMedium: json['picture_medium'] as String,
      pictureBig: json['picture_big'] as String,
      pictureXl: json['picture_xl'] as String,
      radio: json['radio'] as bool,
      tracklist: json['tracklist'] as String,
      position: (json['position'] as num).toInt(),
      type: json['type'] as String,
    );

Map<String, dynamic> _$ArtistToJson(Artist instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'link': instance.link,
      'picture': instance.picture,
      'picture_small': instance.pictureSmall,
      'picture_medium': instance.pictureMedium,
      'picture_big': instance.pictureBig,
      'picture_xl': instance.pictureXl,
      'radio': instance.radio,
      'tracklist': instance.tracklist,
      'position': instance.position,
      'type': instance.type,
    };
