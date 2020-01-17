import 'package:json_annotation/json_annotation.dart';

part 'YoutubeSearchItemId.g.dart';

@JsonSerializable()

class YoutubeSearchItemId{

  String videoId;

  YoutubeSearchItemId(this.videoId);

  factory YoutubeSearchItemId.fromJson(Map<String, dynamic> json) => _$YoutubeSearchItemIdFromJson(json);

  Map<String, dynamic> toJson() => _$YoutubeSearchItemIdToJson(this);
}