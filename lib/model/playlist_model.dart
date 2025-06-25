import 'package:json_annotation/json_annotation.dart';

part 'playlist_model.g.dart';

@JsonSerializable()
class PlaylistsResponse {
  final List<Playlist> data;
  final int total;

  PlaylistsResponse({
    required this.data,
    required this.total,
  });

  factory PlaylistsResponse.fromJson(Map<String, dynamic> json) =>
      _$PlaylistsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PlaylistsResponseToJson(this);
}

@JsonSerializable()
class Playlist {
  final int id;
  final String title;
  final bool public;
  @JsonKey(name: 'nb_tracks')
  final int nbTracks;
  final String link;
  final String picture;
  @JsonKey(name: 'picture_small')
  final String pictureSmall;
  @JsonKey(name: 'picture_medium')
  final String pictureMedium;
  @JsonKey(name: 'picture_big')
  final String pictureBig;
  @JsonKey(name: 'picture_xl')
  final String pictureXl;
  final String checksum;
  final String tracklist;
  @JsonKey(name: 'creation_date')
  final String creationDate;
  @JsonKey(name: 'add_date')
  final String addDate;
  @JsonKey(name: 'mod_date')
  final String modDate;
  @JsonKey(name: 'md5_image')
  final String md5Image;
  @JsonKey(name: 'picture_type')
  final String pictureType;
  final User user;
  final String type;

  Playlist({
    required this.id,
    required this.title,
    required this.public,
    required this.nbTracks,
    required this.link,
    required this.picture,
    required this.pictureSmall,
    required this.pictureMedium,
    required this.pictureBig,
    required this.pictureXl,
    required this.checksum,
    required this.tracklist,
    required this.creationDate,
    required this.addDate,
    required this.modDate,
    required this.md5Image,
    required this.pictureType,
    required this.user,
    required this.type,
  });

  factory Playlist.fromJson(Map<String, dynamic> json) =>
      _$PlaylistFromJson(json);
  Map<String, dynamic> toJson() => _$PlaylistToJson(this);
}

@JsonSerializable()
class User {
  final int id;
  final String name;
  final String tracklist;
  final String type;

  User({
    required this.id,
    required this.name,
    required this.tracklist,
    required this.type,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
