import 'dart:async';
import 'package:path/path.dart';
import 'package:mobx/mobx.dart';
import 'package:sqflite/sqflite.dart';
part 'controller_geral.g.dart';

class ControllerGeral = _ControllerGeralBase with _$ControllerGeral;

abstract class _ControllerGeralBase with Store {



  //Definindo a Estrutura da Tabela_usuario
  String nomeTabela     = 'tbl_usuario';
  String colId          = 'id';
  String colNome        = 'nome';
  String colEmail       = 'email';
  String colCep         = 'cep';
  String colNumero      = 'numero';
  String colBairro      = 'bairro';
  String colUf          = 'uf';
  String colLogradouro  = 'logradouro';
  String colMunicipio   = 'municipio';
  String colComplemento = 'complemento';
  String colTelefone    = 'telefone';
  String colSenha       = 'senha';
  String colData        = 'data_cadastro';

  @observable
  Database _database;

  //Método que ira verificar se o banco foi inicializado
  Future<Database> get database async{
    if (_database == null){
      _database = await getDatabase();
    }
  }



  //Método que cria o banco e executa a construção das tabelas
  Future<Database> getDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'basedata.bd'),
      onCreate: (db, version) async {
        await db.execute('CREATE TABLE $nomeTabela ('
            '$colId INTEGER PRIMARY KEY AUTOINCREMENT, '
            '$colNome Text,'
            '$colEmail Text,'
            '$colCep Text,'
            '$colNumero Text,'
            '$colBairro Text,'
            '$colUf Text,'
            '$colLogradouro Text,'
            '$colMunicipio Text,'
            '$colComplemento Text,'
            '$colTelefone Text,'
            '$colSenha Text,'
            '$colData Text)'
        );

      },
      version: 1,
    );
  }




}