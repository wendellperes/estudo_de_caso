import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testeapi/components/shered/app_colors.dart';
import 'package:testeapi/views/home/home_page.dart';
import 'package:testeapi/views/usuario/usuario.dart';

class HomePageGerencia extends StatefulWidget {
  @override
  HomePageGerenciaState createState() => HomePageGerenciaState();
}

class HomePageGerenciaState extends State<HomePageGerencia> {
  int _indiceAtual = 0;
  List<Widget> _telas;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    // Lista Responsavel pelos itens de widgets de acordo com o numero de buttoes ou abas
    _telas = [
      HomePage(),
      SaudePage(),
    ];
  }
  void onTabTapped(int index) {
    setState(() {
      _indiceAtual = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);

    return new Scaffold(
      body: _telas[_indiceAtual],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        selectedItemColor:  Colors.blue[900],
        unselectedItemColor: Colors.blue[500],
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home,),
              label: 'Inicio'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.assignment_ind_rounded,),
              label: 'Usuários'
          ),
        ],
      ),

    );
  }
}