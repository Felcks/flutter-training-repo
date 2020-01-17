import 'package:json_annotation/json_annotation.dart';

part 'Post.g.dart';

@JsonSerializable()

class Post{

  int userId;
  int id;
  String title;
  String body;


  Post(this.userId, this.id, this.title, this.body);

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$PostToJson(this);


}