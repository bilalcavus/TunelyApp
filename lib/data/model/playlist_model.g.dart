// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaylistsResponse _$PlaylistsResponseFromJson(Map<String, dynamic> json) =>
    PlaylistsResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => Playlist.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$PlaylistsResponseToJson(PlaylistsResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'total': instance.total,
    };

Playlist _$PlaylistFromJson(Map<String, dynamic> json) => Playlist(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      public: json['public'] as bool,
      nbTracks: (json['nb_tracks'] as num).toInt(),
      link: json['link'] as String,
      picture: json['picture'] as String,
      pictureSmall: json['picture_small'] as String,
      pictureMedium: json['picture_medium'] as String,
      pictureBig: json['picture_big'] as String,
      pictureXl: json['picture_xl'] as String,
      checksum: json['checksum'] as String,
      tracklist: json['tracklist'] as String,
      creationDate: json['creation_date'] as String,
      addDate: json['add_date'] as String,
      modDate: json['mod_date'] as String,
      md5Image: json['md5_image'] as String,
      pictureType: json['picture_type'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      type: json['type'] as String,
    );

Map<String, dynamic> _$PlaylistToJson(Playlist instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'public': instance.public,
      'nb_tracks': instance.nbTracks,
      'link': instance.link,
      'picture': instance.picture,
      'picture_small': instance.pictureSmall,
      'picture_medium': instance.pictureMedium,
      'picture_big': instance.pictureBig,
      'picture_xl': instance.pictureXl,
      'checksum': instance.checksum,
      'tracklist': instance.tracklist,
      'creation_date': instance.creationDate,
      'add_date': instance.addDate,
      'mod_date': instance.modDate,
      'md5_image': instance.md5Image,
      'picture_type': instance.pictureType,
      'user': instance.user,
      'type': instance.type,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      tracklist: json['tracklist'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'tracklist': instance.tracklist,
      'type': instance.type,
    };
