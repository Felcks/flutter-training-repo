import 'package:json_annotation/json_annotation.dart';
import 'package:youtube/response/YoutubeSearchItemResponse.dart';

part 'YoutubeSearchResultResponse.g.dart';

@JsonSerializable()

class YoutubeSearchResultResponse{

  String kind;
  String etag;
  String nextPageToken;
  List<YoutubeSearchItemResponse> items;


  YoutubeSearchResultResponse(this.kind, this.etag, this.nextPageToken, this.items);

  factory YoutubeSearchResultResponse.fromJson(Map<String, dynamic> json) => _$YoutubeSearchResultResponseFromJson(json);
  Map<String, dynamic> toJson() => _$YoutubeSearchResultResponseToJson(this);
}