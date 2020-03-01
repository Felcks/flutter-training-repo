// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'round.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Round on _RoundBase, Store {
  final _$numberAtom = Atom(name: '_RoundBase.number');

  @override
  int get number {
    _$numberAtom.context.enforceReadPolicy(_$numberAtom);
    _$numberAtom.reportObserved();
    return super.number;
  }

  @override
  set number(int value) {
    _$numberAtom.context.conditionallyRunInAction(() {
      super.number = value;
      _$numberAtom.reportChanged();
    }, _$numberAtom, name: '${_$numberAtom.name}_set');
  }

  final _$gamesAtom = Atom(name: '_RoundBase.games');

  @override
  List<Game> get games {
    _$gamesAtom.context.enforceReadPolicy(_$gamesAtom);
    _$gamesAtom.reportObserved();
    return super.games;
  }

  @override
  set games(List<Game> value) {
    _$gamesAtom.context.conditionallyRunInAction(() {
      super.games = value;
      _$gamesAtom.reportChanged();
    }, _$gamesAtom, name: '${_$gamesAtom.name}_set');
  }

  @override
  String toString() {
    final string = 'number: ${number.toString()},games: ${games.toString()}';
    return '{$string}';
  }
}
