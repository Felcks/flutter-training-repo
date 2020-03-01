// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$gameListAtom = Atom(name: '_HomeControllerBase.gameList');

  @override
  List<Game> get gameList {
    _$gameListAtom.context.enforceReadPolicy(_$gameListAtom);
    _$gameListAtom.reportObserved();
    return super.gameList;
  }

  @override
  set gameList(List<Game> value) {
    _$gameListAtom.context.conditionallyRunInAction(() {
      super.gameList = value;
      _$gameListAtom.reportChanged();
    }, _$gameListAtom, name: '${_$gameListAtom.name}_set');
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic changeRound(int newRound) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.changeRound(newRound);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeResultOwnerTeam(int newValue) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.changeResultOwnerTeam(newValue);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'gameList: ${gameList.toString()}';
    return '{$string}';
  }
}
