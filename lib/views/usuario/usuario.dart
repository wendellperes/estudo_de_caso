import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:testeapi/components/shered/app_colors.dart';

class SaudePage extends StatefulWidget {
  @override
  SaudePageState createState() => SaudePageState();
}

class SaudePageState extends State<SaudePage> {
  //AuthenticationEmailController authenticationEmailController;


  @override
  void initState() {
    super.initState();
  }

  void navigationToNextPage(bool) {

      // bool ? Navigator.push(context,
      //     MaterialPageRoute(
      //         builder: (context) => LoginPage()
      //     )) : Container();

  }

  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    // authenticationEmailController = Provider.of<AuthenticationEmailController>(context, listen: false);
    // authenticationEmailController.Userloggado(isNotLogado: navigationToNextPage);

  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        leading: Icon(Icons.ac_unit, color: Colors.blue[900],),
        title: new Text('Usuario Unificados'),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
      body: new Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/bemol_logo.jpeg'),
            GestureDetector(
              onTap: (){
                Navigator.pushReplacementNamed(context, '/listUser');
              },
              child: Container(
                width: 140,
                height: 75,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.blue[900],
                    borderRadius: BorderRadius.circular(50)
                ),
                child: Text('Listar Usuarios com Chamados Abertos', textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                width: 140,
                height: 75,
                decoration: BoxDecoration(
                    color: Colors.blue[900],
                    borderRadius: BorderRadius.circular(50)
                ),
                child: ElevatedButton(
                  child: Text('Listar Usuarios com Chamados Resolvidos', textAlign: TextAlign.center,),
                  onPressed: (){

                  },
                )
            ),
          ],
        ),
      ),


    );
  }
}