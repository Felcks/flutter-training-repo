// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ListagemPost.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListagemPost _$ListagemPostFromJson(Map<String, dynamic> json) {
  return ListagemPost(
    (json['listaPost'] as List)
        ?.map(
            (e) => e == null ? null : Post.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ListagemPostToJson(ListagemPost instance) =>
    <String, dynamic>{
      'listaPost': instance.listaPost,
    };
