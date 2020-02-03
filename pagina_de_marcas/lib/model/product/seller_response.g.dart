// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seller_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SellerResponse _$SellerResponseFromJson(Map<String, dynamic> json) {
  return SellerResponse()
    ..Price = (json['Price'] as num)?.toDouble()
    ..ListPrice = (json['ListPrice'] as num)?.toDouble();
}

Map<String, dynamic> _$SellerResponseToJson(SellerResponse instance) =>
    <String, dynamic>{
      'Price': instance.Price,
      'ListPrice': instance.ListPrice,
    };
