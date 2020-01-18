// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Tarefa.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tarefa _$TarefaFromJson(Map<String, dynamic> json) {
  return Tarefa(
    json['nome'] as String,
    json['realizada'] as bool,
  );
}

Map<String, dynamic> _$TarefaToJson(Tarefa instance) => <String, dynamic>{
      'nome': instance.nome,
      'realizada': instance.realizada,
    };
