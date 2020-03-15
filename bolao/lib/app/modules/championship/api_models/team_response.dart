import 'package:bolao/app/modules/championship/models/team_base.dart';
import 'package:json_annotation/json_annotation.dart';

part 'team_response.g.dart';

@JsonSerializable()
class TeamResponse {
  TeamResponse();

  String name;
  String image_url;

  factory TeamResponse.fromJson(Map<String, dynamic> json) =>
      _$TeamResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TeamResponseToJson(this);

  static TeamBase toDomain(TeamResponse response){
    return TeamBase(response.name, response.image_url);
  }
}
