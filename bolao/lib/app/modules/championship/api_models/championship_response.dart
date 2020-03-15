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

  ChampionshipResponse();

  factory ChampionshipResponse.fromJson(Map<String, dynamic> json) =>
      _$ChampionshipResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ChampionshipResponseToJson(this);

  static Championship toDomain(ChampionshipResponse response) {
    return Championship(response.name, response.season, response.current_round, response.type, response.title_image_url, []);
  }
}
