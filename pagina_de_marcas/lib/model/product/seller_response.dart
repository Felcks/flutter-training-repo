import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';

part 'seller_response.g.dart';

@JsonSerializable()

class SellerResponse{

  double Price;
  double ListPrice;
  int Quantity;

  SellerResponse();

  factory SellerResponse.fromJson(Map<String, dynamic> json) =>
      _$SellerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SellerResponseToJson(this);


}