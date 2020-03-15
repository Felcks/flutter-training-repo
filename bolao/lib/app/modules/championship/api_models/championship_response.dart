import 'package:bolao/app/modules/championship/api_models/round_response.dart';
import 'package:bolao/app/modules/championship/models/championship.dart';
import 'package:json_annotation/json_annotation.dart';

part 'championship_response.g.dart';

@JsonSerializable()
class ChampionshipResponse {
  String id;
  String name;
  String season;
  int current_round;
  int type;
  String title_image_url;
  List<RoundResponse> round_list;

  ChampionshipResponse();

  factory ChampionshipResponse.fromJson(Map<String, dynamic> json) =>
      _$ChampionshipResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ChampionshipResponseToJson(this);

  static Championship toDomain(ChampionshipResponse response) {
    return Championship(
        response.name,
        response.season,
        response.current_round,
        response.type,
        response.title_image_url,
        response.round_list.map((model) => RoundResponse.toDomain(model)));
  }
}
