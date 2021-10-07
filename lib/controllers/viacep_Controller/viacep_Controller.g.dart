// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'viacep_Controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ViaCepController on _ViaCepControllerBase, Store {
  final _$UserIdAtom = Atom(name: '_ViaCepControllerBase.UserId');

  @override
  String get UserId {
    _$UserIdAtom.reportRead();
    return super.UserId;
  }

  @override
  set UserId(String value) {
    _$UserIdAtom.reportWrite(value, super.UserId, () {
      super.UserId = value;
    });
  }

  final _$AuthenticationCepAsyncAction =
      AsyncAction('_ViaCepControllerBase.AuthenticationCep');

  @override
  Future<dynamic> AuthenticationCep({String cep}) {
    return _$AuthenticationCepAsyncAction
        .run(() => super.AuthenticationCep(cep: cep));
  }

  @override
  String toString() {
    return '''
UserId: ${UserId}
    ''';
  }
}
