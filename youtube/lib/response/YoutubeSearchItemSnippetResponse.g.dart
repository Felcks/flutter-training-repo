// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'YoutubeSearchItemSnippetResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

YoutubeSearchItemSnippetResponse _$YoutubeSearchItemSnippetResponseFromJson(
    Map<String, dynamic> json) {
  return YoutubeSearchItemSnippetResponse(
    json['title'] as String,
    json['channelTitle'] as String,
  )..thumbnails = json['thumbnails'] == null
      ? null
      : YoutubeSearchThumbnailsResponse.fromJson(
          json['thumbnails'] as Map<String, dynamic>);
}

Map<String, dynamic> _$YoutubeSearchItemSnippetResponseToJson(
        YoutubeSearchItemSnippetResponse instance) =>
    <String, dynamic>{
      'title': instance.title,
      'channelTitle': instance.channelTitle,
      'thumbnails': instance.thumbnails,
    };
