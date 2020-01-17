import 'package:json_annotation/json_annotation.dart';
import 'package:youtube/response/YoutubeSearchThumbnailsResponse.dart';


part 'YoutubeSearchItemSnippetResponse.g.dart';

@JsonSerializable()

class YoutubeSearchItemSnippetResponse{

  String title;
  String channelTitle;
  YoutubeSearchThumbnailsResponse thumbnails;

  YoutubeSearchItemSnippetResponse(this.title, this.channelTitle);

  factory YoutubeSearchItemSnippetResponse.fromJson(Map<String, dynamic> json) => _$YoutubeSearchItemSnippetResponseFromJson(json);
  Map<String, dynamic> toJson() => _$YoutubeSearchItemSnippetResponseToJson(this);



}