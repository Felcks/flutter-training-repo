import 'package:json_annotation/json_annotation.dart';

part 'Tarefa.g.dart';

@JsonSerializable()

class Tarefa{

  String nome;
  bool realizada;

  Tarefa(this.nome, this.realizada);

  factory Tarefa.fromJson(Map<String, dynamic> json) => _$TarefaFromJson(json);

  Map<String, dynamic> toJson() => _$TarefaToJson(this);


}