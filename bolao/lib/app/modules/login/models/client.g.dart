// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Client on _ClientBase, Store {
  final _$emailOrNameAtom = Atom(name: '_ClientBase.emailOrName');

  @override
  String get emailOrName {
    _$emailOrNameAtom.context.enforceReadPolicy(_$emailOrNameAtom);
    _$emailOrNameAtom.reportObserved();
    return super.emailOrName;
  }

  @override
  set emailOrName(String value) {
    _$emailOrNameAtom.context.conditionallyRunInAction(() {
      super.emailOrName = value;
      _$emailOrNameAtom.reportChanged();
    }, _$emailOrNameAtom, name: '${_$emailOrNameAtom.name}_set');
  }

  final _$passwordAtom = Atom(name: '_ClientBase.password');

  @override
  String get password {
    _$passwordAtom.context.enforceReadPolicy(_$passwordAtom);
    _$passwordAtom.reportObserved();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.context.conditionallyRunInAction(() {
      super.password = value;
      _$passwordAtom.reportChanged();
    }, _$passwordAtom, name: '${_$passwordAtom.name}_set');
  }

  final _$_ClientBaseActionController = ActionController(name: '_ClientBase');

  @override
  dynamic changeEmailOrName(String value) {
    final _$actionInfo = _$_ClientBaseActionController.startAction();
    try {
      return super.changeEmailOrName(value);
    } finally {
      _$_ClientBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changePassword(String value) {
    final _$actionInfo = _$_ClientBaseActionController.startAction();
    try {
      return super.changePassword(value);
    } finally {
      _$_ClientBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'emailOrName: ${emailOrName.toString()},password: ${password.toString()}';
    return '{$string}';
  }
}
