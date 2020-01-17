// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'YoutubeSearchResultResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

YoutubeSearchResultResponse _$YoutubeSearchResultResponseFromJson(
    Map<String, dynamic> json) {
  return YoutubeSearchResultResponse(
    json['kind'] as String,
    json['etag'] as String,
    json['nextPageToken'] as String,
    (json['items'] as List)
        ?.map((e) => e == null
            ? null
            : YoutubeSearchItemResponse.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$YoutubeSearchResultResponseToJson(
        YoutubeSearchResultResponse instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'etag': instance.etag,
      'nextPageToken': instance.nextPageToken,
      'items': instance.items,
    };
