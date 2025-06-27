import 'package:json_annotation/json_annotation.dart';
import 'album_model.dart';

part 'albums_response_model.g.dart';

@JsonSerializable()
class AlbumsResponse {
  final List<Album> data;
  final int total;

  AlbumsResponse({
    required this.data,
    required this.total,
  });

  factory AlbumsResponse.fromJson(Map<String, dynamic> json) =>
      _$AlbumsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumsResponseToJson(this);
}
