// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  Computed<bool> _$canDecreaseRoundComputed;

  @override
  bool get canDecreaseRound => (_$canDecreaseRoundComputed ??=
          Computed<bool>(() => super.canDecreaseRound))
      .value;
  Computed<bool> _$canIncreaseRoundComputed;

  @override
  bool get canIncreaseRound => (_$canIncreaseRoundComputed ??=
          Computed<bool>(() => super.canIncreaseRound))
      .value;
  Computed<Round> _$currentRoundComputed;

  @override
  Round get currentRound =>
      (_$currentRoundComputed ??= Computed<Round>(() => super.currentRound))
          .value;

  final _$gameListAtom = Atom(name: '_HomeControllerBase.gameList');

  @override
  ObservableList<Game> get gameList {
    _$gameListAtom.context.enforceReadPolicy(_$gameListAtom);
    _$gameListAtom.reportObserved();
    return super.gameList;
  }

  @override
  set gameList(ObservableList<Game> value) {
    _$gameListAtom.context.conditionallyRunInAction(() {
      super.gameList = value;
      _$gameListAtom.reportChanged();
    }, _$gameListAtom, name: '${_$gameListAtom.name}_set');
  }

  final _$championshipAtom = Atom(name: '_HomeControllerBase.championship');

  @override
  Championship get championship {
    _$championshipAtom.context.enforceReadPolicy(_$championshipAtom);
    _$championshipAtom.reportObserved();
    return super.championship;
  }

  @override
  set championship(Championship value) {
    _$championshipAtom.context.conditionallyRunInAction(() {
      super.championship = value;
      _$championshipAtom.reportChanged();
    }, _$championshipAtom, name: '${_$championshipAtom.name}_set');
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic increaseRound() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.increaseRound();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic decreaseRound() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.decreaseRound();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'gameList: ${gameList.toString()},championship: ${championship.toString()},canDecreaseRound: ${canDecreaseRound.toString()},canIncreaseRound: ${canIncreaseRound.toString()},currentRound: ${currentRound.toString()}';
    return '{$string}';
  }
}
