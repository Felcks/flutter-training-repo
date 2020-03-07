// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'championship_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ChampionshipController on _ChampionshipControllerBase, Store {
  final _$currentPageAtom =
      Atom(name: '_ChampionshipControllerBase.currentPage');

  @override
  int get currentPage {
    _$currentPageAtom.context.enforceReadPolicy(_$currentPageAtom);
    _$currentPageAtom.reportObserved();
    return super.currentPage;
  }

  @override
  set currentPage(int value) {
    _$currentPageAtom.context.conditionallyRunInAction(() {
      super.currentPage = value;
      _$currentPageAtom.reportChanged();
    }, _$currentPageAtom, name: '${_$currentPageAtom.name}_set');
  }

  final _$championshipListAtom =
      Atom(name: '_ChampionshipControllerBase.championshipList');

  @override
  ObservableFuture<List<Championship>> get championshipList {
    _$championshipListAtom.context.enforceReadPolicy(_$championshipListAtom);
    _$championshipListAtom.reportObserved();
    return super.championshipList;
  }

  @override
  set championshipList(ObservableFuture<List<Championship>> value) {
    _$championshipListAtom.context.conditionallyRunInAction(() {
      super.championshipList = value;
      _$championshipListAtom.reportChanged();
    }, _$championshipListAtom, name: '${_$championshipListAtom.name}_set');
  }

  final _$_ChampionshipControllerBaseActionController =
      ActionController(name: '_ChampionshipControllerBase');

  @override
  dynamic fetchChampionshipList() {
    final _$actionInfo =
        _$_ChampionshipControllerBaseActionController.startAction();
    try {
      return super.fetchChampionshipList();
    } finally {
      _$_ChampionshipControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic fetchJackpotList() {
    final _$actionInfo =
        _$_ChampionshipControllerBaseActionController.startAction();
    try {
      return super.fetchJackpotList();
    } finally {
      _$_ChampionshipControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCurrentPage(int newPage) {
    final _$actionInfo =
        _$_ChampionshipControllerBaseActionController.startAction();
    try {
      return super.setCurrentPage(newPage);
    } finally {
      _$_ChampionshipControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'currentPage: ${currentPage.toString()},championshipList: ${championshipList.toString()}';
    return '{$string}';
  }
}
