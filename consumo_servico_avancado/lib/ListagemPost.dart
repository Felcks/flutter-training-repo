import 'package:consumo_servico_avancado/Post.dart';
import 'package:json_annotation/json_annotation.dart';

import 'Post.dart';

part 'ListagemPost.g.dart';

@JsonSerializable()

class ListagemPost{

  List<Post> listaPost;


  ListagemPost(this.listaPost);

  factory ListagemPost.fromJson(Map<String, dynamic> json) => _$ListagemPostFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$ListagemPostToJson(this);
}