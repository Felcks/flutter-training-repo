// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductController on ProductControllerBase, Store {
  final _$productAmountAtom = Atom(name: 'ProductControllerBase.productAmount');

  @override
  int get productAmount {
    _$productAmountAtom.context.enforceReadPolicy(_$productAmountAtom);
    _$productAmountAtom.reportObserved();
    return super.productAmount;
  }

  @override
  set productAmount(int value) {
    _$productAmountAtom.context.conditionallyRunInAction(() {
      super.productAmount = value;
      _$productAmountAtom.reportChanged();
    }, _$productAmountAtom, name: '${_$productAmountAtom.name}_set');
  }

  final _$ProductControllerBaseActionController =
      ActionController(name: 'ProductControllerBase');

  @override
  dynamic setProductAmount(int value) {
    final _$actionInfo = _$ProductControllerBaseActionController.startAction();
    try {
      return super.setProductAmount(value);
    } finally {
      _$ProductControllerBaseActionController.endAction(_$actionInfo);
    }
  }
}
