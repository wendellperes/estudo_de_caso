import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:sqflite/sqflite.dart';
import 'package:testeapi/controllers/geral_Controller/controller_geral.dart';
import 'package:testeapi/models/User/Usuario.dart';
part 'controller_inserir.g.dart';

class ControllerInserir = _ControllerInserirBase with _$ControllerInserir;

abstract class _ControllerInserirBase with Store {
  ControllerGeral controllerGeral =  ControllerGeral();
  @observable
  int idCadastro;
  @observable
  int idade;
  @action
  Future<void>Cadastrar({
    @required String nome,
    @required String email,
    @required String data,
    @required String cep,
    @required String numero,
    @required String bairro,
    @required String uf,
    @required String logradouro,
    @required String municipio,
    @required String complemento,
    @required String telefone,
    @required String senha,
    @required Function onsuccess,}
      ) async {

    try {
      final Database db = await controllerGeral.getDatabase();
      var dados =  Usuario(
          name: nome,
          email: email,
          cep: cep,
          numero: numero,
          bairro: bairro,
          logradouro: logradouro,
          uf: uf,
          municipio: municipio,
          complemento: complemento,
          senha: senha,
          telefone: telefone,
          data_criacao: data
      );
      //print(idade);
      idCadastro  = await db.insert(
        'tbl_usuario',
        dados.toMap(),
      );
      idCadastro != 0 ? onsuccess(true) : onsuccess(false);
    } catch (ex) {
      print(ex);
      return;
    }



  }



}