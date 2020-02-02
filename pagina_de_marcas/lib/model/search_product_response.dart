import 'package:json_annotation/json_annotation.dart';
import 'package:pagina_de_marcas/model/product_response.dart';

part 'search_product_response.g.dart';

@JsonSerializable()

class SearchProductResponse{

  int Size;
  int Total;
  List<ProductResponse> Products;


  SearchProductResponse();

  factory SearchProductResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SearchProductResponseToJson(this);


}