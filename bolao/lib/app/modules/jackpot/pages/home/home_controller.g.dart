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

  final _$jackpotAtom = Atom(name: '_HomeControllerBase.jackpot');

  @override
  Jackpot get jackpot {
    _$jackpotAtom.context.enforceReadPolicy(_$jackpotAtom);
    _$jackpotAtom.reportObserved();
    return super.jackpot;
  }

  @override
  set jackpot(Jackpot value) {
    _$jackpotAtom.context.conditionallyRunInAction(() {
      super.jackpot = value;
      _$jackpotAtom.reportChanged();
    }, _$jackpotAtom, name: '${_$jackpotAtom.name}_set');
  }

  final _$currentPageAtom = Atom(name: '_HomeControllerBase.currentPage');

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

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic setJackpot(Jackpot jackpot) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.setJackpot(jackpot);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCurrentPage(int page) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.setCurrentPage(page);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  List<JackpotUser> getUsersByRoundRank() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.getUsersByRoundRank();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  List<JackpotUser> getUsersByOverallRank() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.getUsersByOverallRank();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void rankingUsersWithouRoundScore(JackpotUser user) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.rankingUsersWithouRoundScore(user);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

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
        'jackpot: ${jackpot.toString()},currentPage: ${currentPage.toString()},gameList: ${gameList.toString()},canDecreaseRound: ${canDecreaseRound.toString()},canIncreaseRound: ${canIncreaseRound.toString()},currentRound: ${currentRound.toString()}';
    return '{$string}';
  }
}
