import 'dart:io';
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
part 'viacep_Controller.g.dart';

class ViaCepController = _ViaCepControllerBase with _$ViaCepController;

abstract class _ViaCepControllerBase with Store {

  @observable
  String UserId;

  @action
  // ignore: non_constant_identifier_names
  Future AuthenticationCep({@required String cep,}) async {
    try {

      final response = await Dio().get(
          'https://viacep.com.br/ws/$cep/json/',
          options: Options(
              headers: {"Accept": "application/json"},
          ),
      );
      // print(response.data);
      if(response.statusCode == 200){
        return response.data;
      }
    } on DioError catch (error){
      if(error.response.statusCode == 500){
        return error.message;
      }
    }

  }


}