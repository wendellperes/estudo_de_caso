import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testeapi/views/createUser/createUser.dart';
import 'package:testeapi/views/home/home_page.dart';
import 'package:testeapi/views/home_gerencia/home_gerencia.dart';
import 'package:testeapi/views/listaUser/lista_user.dart';
import 'package:testeapi/views/login/login_page.dart';
import 'package:testeapi/views/usuario/usuario.dart';
import 'package:testeapi/views/splash/splashscreen.dart';
import 'package:testeapi/views/validar_email/validar_email.dart';

import 'controllers/cadastrarUser_Controller/controller_inserir.dart';
import 'controllers/viacep_Controller/viacep_Controller.dart';

void main() {
  runApp(
      MultiProvider(
        providers: [
          Provider<ViaCepController>(
            create: (_) => ViaCepController(),
          ),
          Provider<ControllerInserir>(
            create: (_) => ControllerInserir(),
          ),
        ],
        child: MyApp(),
      )

  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MVC - App Example solution ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        //uso Rotas Nomeadas
        '/': (context) => SplashPage(),
        '/HomePageGerencia': (context) => HomePageGerencia(),
        '/LoginPage': (context) => LoginPage(),
        '/validarEmail': (context) => ValidarEmail(),
        '/CreateUser': (context) => CreateUser(),
        '/saude': (context) => SaudePage(),
        '/listUser': (context) => ListUser(),
        // '/Cadastrar': (context) => CreateUser(),
        // '/Atualizar': (context) => UpdateUser(),
      },
      initialRoute: '/',
    );
  }
}


