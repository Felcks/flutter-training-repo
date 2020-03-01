// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Team on _TeamBase, Store {
  final _$scoreAtom = Atom(name: '_TeamBase.score');

  @override
  int get score {
    _$scoreAtom.context.enforceReadPolicy(_$scoreAtom);
    _$scoreAtom.reportObserved();
    return super.score;
  }

  @override
  set score(int value) {
    _$scoreAtom.context.conditionallyRunInAction(() {
      super.score = value;
      _$scoreAtom.reportChanged();
    }, _$scoreAtom, name: '${_$scoreAtom.name}_set');
  }

  final _$_TeamBaseActionController = ActionController(name: '_TeamBase');

  @override
  dynamic setScore(int newScore) {
    final _$actionInfo = _$_TeamBaseActionController.startAction();
    try {
      return super.setScore(newScore);
    } finally {
      _$_TeamBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'score: ${score.toString()}';
    return '{$string}';
  }
}
