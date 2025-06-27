// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'albums_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlbumsResponse _$AlbumsResponseFromJson(Map<String, dynamic> json) =>
    AlbumsResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => Album.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$AlbumsResponseToJson(AlbumsResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'total': instance.total,
    };
