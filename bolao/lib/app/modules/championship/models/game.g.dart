// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Game on _GameBase, Store {
  final _$ownerTeamAtom = Atom(name: '_GameBase.ownerTeam');

  @override
  Team get ownerTeam {
    _$ownerTeamAtom.context.enforceReadPolicy(_$ownerTeamAtom);
    _$ownerTeamAtom.reportObserved();
    return super.ownerTeam;
  }

  @override
  set ownerTeam(Team value) {
    _$ownerTeamAtom.context.conditionallyRunInAction(() {
      super.ownerTeam = value;
      _$ownerTeamAtom.reportChanged();
    }, _$ownerTeamAtom, name: '${_$ownerTeamAtom.name}_set');
  }

  final _$visitingTeamAtom = Atom(name: '_GameBase.visitingTeam');

  @override
  Team get visitingTeam {
    _$visitingTeamAtom.context.enforceReadPolicy(_$visitingTeamAtom);
    _$visitingTeamAtom.reportObserved();
    return super.visitingTeam;
  }

  @override
  set visitingTeam(Team value) {
    _$visitingTeamAtom.context.conditionallyRunInAction(() {
      super.visitingTeam = value;
      _$visitingTeamAtom.reportChanged();
    }, _$visitingTeamAtom, name: '${_$visitingTeamAtom.name}_set');
  }

  @override
  String toString() {
    final string =
        'ownerTeam: ${ownerTeam.toString()},visitingTeam: ${visitingTeam.toString()}';
    return '{$string}';
  }
}
