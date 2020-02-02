import 'package:json_annotation/json_annotation.dart';
import 'package:pagina_de_marcas/model/sku_response.dart';

part 'product_response.g.dart';


@JsonSerializable()

class ProductResponse{

  List<SkuResponse> Skus;
  String Name;

  ProductResponse();

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductResponseToJson(this);


}