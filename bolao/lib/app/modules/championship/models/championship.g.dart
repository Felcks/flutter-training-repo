// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'championship.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Championship on _ChampionshipBase, Store {
  final _$nameAtom = Atom(name: '_ChampionshipBase.name');

  @override
  String get name {
    _$nameAtom.context.enforceReadPolicy(_$nameAtom);
    _$nameAtom.reportObserved();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.context.conditionallyRunInAction(() {
      super.name = value;
      _$nameAtom.reportChanged();
    }, _$nameAtom, name: '${_$nameAtom.name}_set');
  }

  final _$roundsAtom = Atom(name: '_ChampionshipBase.rounds');

  @override
  List<Round> get rounds {
    _$roundsAtom.context.enforceReadPolicy(_$roundsAtom);
    _$roundsAtom.reportObserved();
    return super.rounds;
  }

  @override
  set rounds(List<Round> value) {
    _$roundsAtom.context.conditionallyRunInAction(() {
      super.rounds = value;
      _$roundsAtom.reportChanged();
    }, _$roundsAtom, name: '${_$roundsAtom.name}_set');
  }

  @override
  String toString() {
    final string = 'name: ${name.toString()},rounds: ${rounds.toString()}';
    return '{$string}';
  }
}
