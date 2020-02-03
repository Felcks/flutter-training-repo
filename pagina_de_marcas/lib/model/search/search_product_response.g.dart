// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchProductResponse _$SearchProductResponseFromJson(
    Map<String, dynamic> json) {
  return SearchProductResponse()
    ..Size = json['Size'] as int
    ..Total = json['Total'] as int
    ..Products = (json['Products'] as List)
        ?.map((e) => e == null
            ? null
            : ProductResponse.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$SearchProductResponseToJson(
        SearchProductResponse instance) =>
    <String, dynamic>{
      'Size': instance.Size,
      'Total': instance.Total,
      'Products': instance.Products,
    };
