// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_product_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchProductRequest _$SearchProductRequestFromJson(Map<String, dynamic> json) {
  return SearchProductRequest(
    json['Query'] as String,
    json['Offset'] as int,
    json['Size'] as int,
  );
}

Map<String, dynamic> _$SearchProductRequestToJson(
        SearchProductRequest instance) =>
    <String, dynamic>{
      'Query': instance.Query,
      'Offset': instance.Offset,
      'Size': instance.Size,
    };
