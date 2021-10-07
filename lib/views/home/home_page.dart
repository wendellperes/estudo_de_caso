import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testeapi/components/shered/app_colors.dart';
import 'package:testeapi/views/usuario/usuario.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _indiceAtual = 0;
  List<Widget> _telas;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
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
      backgroundColor: Colors.white,
        appBar: new AppBar(
          title: new Text('Homepage'),
          centerTitle: true,
          backgroundColor: Colors.blue[900],
          leading: Icon(Icons.ac_unit, color: Colors.blue[900],),
        ),
        body: Center(
          child: new Container(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('images/bemol_logo.jpeg'),
              ],
            ),
          ),
        ),

    );
  }
}