import 'package:json_annotation/json_annotation.dart';


part 'YoutubeSearchThumbnailTypeResponse.g.dart';

@JsonSerializable()


class YoutubeSearchThumbnailTypeResponse{

  String url;

  YoutubeSearchThumbnailTypeResponse(this.url);

  factory YoutubeSearchThumbnailTypeResponse.fromJson(
      Map<String, dynamic> json) =>
      _$YoutubeSearchThumbnailTypeResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$YoutubeSearchThumbnailTypeResponseToJson(this);


}