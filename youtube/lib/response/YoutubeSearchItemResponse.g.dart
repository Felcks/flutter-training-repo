// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'YoutubeSearchItemResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

YoutubeSearchItemResponse _$YoutubeSearchItemResponseFromJson(
    Map<String, dynamic> json) {
  return YoutubeSearchItemResponse(
    json['kind'] as String,
    json['etag'] as String,
    json['snippet'] == null
        ? null
        : YoutubeSearchItemSnippetResponse.fromJson(
            json['snippet'] as Map<String, dynamic>),
    json['id'] == null
        ? null
        : YoutubeSearchItemId.fromJson(json['id'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$YoutubeSearchItemResponseToJson(
        YoutubeSearchItemResponse instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'etag': instance.etag,
      'snippet': instance.snippet,
      'id': instance.id,
    };
