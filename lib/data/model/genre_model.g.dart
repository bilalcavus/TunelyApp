// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genre_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenreList _$GenreListFromJson(Map<String, dynamic> json) => GenreList(
      data: (json['data'] as List<dynamic>)
          .map((e) => Genre.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GenreListToJson(GenreList instance) => <String, dynamic>{
      'data': instance.data,
    };

Genre _$GenreFromJson(Map<String, dynamic> json) => Genre(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      picture: json['picture'] as String,
      pictureSmall: json['picture_small'] as String,
      pictureMedium: json['picture_medium'] as String,
      pictureBig: json['picture_big'] as String,
      pictureXl: json['picture_xl'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$GenreToJson(Genre instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'picture': instance.picture,
      'picture_small': instance.pictureSmall,
      'picture_medium': instance.pictureMedium,
      'picture_big': instance.pictureBig,
      'picture_xl': instance.pictureXl,
      'type': instance.type,
    };
