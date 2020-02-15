import 'package:json_annotation/json_annotation.dart';
import 'package:pagina_de_marcas/model/product/rating_response.dart';
import 'package:pagina_de_marcas/model/product/seller_response.dart';
import 'package:pagina_de_marcas/model/product/sku_response.dart';

part 'product_response.g.dart';


@JsonSerializable()

class ProductResponse{

  List<SkuResponse> Skus;
  String Name;
  String Brand;
  RatingResponse RatingResume;

  ProductResponse();

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductResponseToJson(this);

  SkuResponse _getFirstSkuAvailable(){

    for(SkuResponse element in this.Skus){

      SellerResponse seller = element.getFirstSellerWithQuantity();
      if(seller != null){
        return element;
      }
    }

    return null;
  }

  SkuResponse getFirstSkuAvailableOrFirstAnyway(){

    return _getFirstSkuAvailable() ?? Skus[0];
  }
}