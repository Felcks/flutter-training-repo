import 'package:json_annotation/json_annotation.dart';
import 'package:youtube/response/YoutubeSearchThumbnailTypeResponse.dart';

part 'YoutubeSearchThumbnailsResponse.g.dart';

@JsonSerializable()


class YoutubeSearchThumbnailsResponse{


  @JsonKey(name: "default")
  YoutubeSearchThumbnailTypeResponse mDefault;

  YoutubeSearchThumbnailTypeResponse medium;

  YoutubeSearchThumbnailTypeResponse high;


  YoutubeSearchThumbnailsResponse(this.mDefault, this.medium, this.high);

  factory YoutubeSearchThumbnailsResponse.fromJson(Map<String, dynamic> json) => _$YoutubeSearchThumbnailsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$YoutubeSearchThumbnailsResponseToJson(this);
}