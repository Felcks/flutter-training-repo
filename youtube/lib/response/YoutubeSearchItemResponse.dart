import 'package:json_annotation/json_annotation.dart';
import 'package:youtube/response/YoutubeSearchItemId.dart';
import 'package:youtube/response/YoutubeSearchItemSnippetResponse.dart';

part 'YoutubeSearchItemResponse.g.dart';

@JsonSerializable()

class YoutubeSearchItemResponse{
  String kind;
  String etag;
  YoutubeSearchItemSnippetResponse snippet;
  YoutubeSearchItemId id;

  YoutubeSearchItemResponse(this.kind, this.etag, this.snippet, this.id);

  factory YoutubeSearchItemResponse.fromJson(Map<String, dynamic> json) => _$YoutubeSearchItemResponseFromJson(json);
  Map<String, dynamic> toJson() => _$YoutubeSearchItemResponseToJson(this);
}