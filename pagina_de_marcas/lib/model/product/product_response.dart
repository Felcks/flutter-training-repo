import 'package:json_annotation/json_annotation.dart';
import 'package:pagina_de_marcas/model/product/rating_response.dart';
import 'package:pagina_de_marcas/model/product/sku_response.dart';

part 'product_response.g.dart';


@JsonSerializable()

class ProductResponse{

  List<SkuResponse> Skus;
  String Name;
  RatingResponse RatingResume;

  ProductResponse();

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductResponseToJson(this);


}