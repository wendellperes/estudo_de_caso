import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testeapi/components/shered/app_colors.dart';
import 'package:testeapi/components/shered/app_style_bordas.dart';
import 'package:testeapi/components/widgets/button_custom.dart';
import 'package:testeapi/components/widgets/popup.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey                          = GlobalKey<ScaffoldState>();
  final TextEditingController _emailControle = TextEditingController();
  final TextEditingController _senhaControle = TextEditingController();
  bool _securityPassword = true;
  bool isCheckLogin;

  // ValidadeEmailController validadeEmailController;


  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    // validadeEmailController = Provider.of<ValidadeEmailController>(context, listen: false);
  }
  _onsuccess( bool response){

    if (response == true){
      Navigator.pop(context);
      Navigator.pushReplacementNamed(context, '/saude');
    }else{
      Navigator.pop(context);
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text('Email ou Senha Inválidos...'),
        backgroundColor: Colors.red,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: Container(
          color: Colors.white,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    child: Image.asset(
                      'images/bemol_logo.jpeg',
                      width: 200,
                      height: 276,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Digite seu email e sua Senha para Entrar',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 26.0, top:26.0, right: 26.0, bottom: 10.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: _emailControle,
                            keyboardType: TextInputType.emailAddress,

                            decoration: InputDecoration(
                              labelText: 'Email*',
                              labelStyle: TextStyle(
                                fontSize: 15,
                                color: Colors.black38,
                                fontWeight: FontWeight.w400,
                              ),
                              disabledBorder: disabledBorder,
                              enabledBorder: enabledBorder,
                              focusedBorder: focusedBorder,
                              border:  border,
                            ),
                            validator: (value){
                              if ( value.isEmpty){
                                return 'Campo nao pode ser vazio';
                              } else if(!value.contains('@')){
                                return 'e-mail Inválido!';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: _senhaControle,
                            keyboardType: TextInputType.visiblePassword,
                            validator: (value) => value.length < 6 ? 'Insira uma senha válida (mínimo 6 caracteres).' : null,
                            decoration: InputDecoration(
                              labelText: 'Senha*',
                              labelStyle: TextStyle(
                                fontSize: 15,
                                color: Colors.black38,
                                fontWeight: FontWeight.w400,
                              ),
                              disabledBorder: disabledBorder,
                              enabledBorder: enabledBorder,
                              focusedBorder: focusedBorder,
                              border:  border,

                              suffixIcon: IconButton(
                                  icon: Icon(
                                    Icons.visibility,
                                    color: _securityPassword ? Colors.black : Colors.black26,),
                                  onPressed: (){
                                    setState(() {
                                      _securityPassword = !_securityPassword;
                                    });
                                  }
                              ),
                            ),
                            obscureText: _securityPassword,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left:26.0, right: 26.0, bottom: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          child: GestureDetector(
                            onTap: (){
                              print('cadastrar');
                              Navigator.pushNamed(context, '/CreateUser');
                            },
                            child: Text(
                              'Cadastra-se, clique aqui!',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.blue[900]),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  //montagem do butão com padding para ajustar seu tamanho
                  ButtonCustom(
                    title: 'Entrar',
                    ontap: () async {
                    if(_formKey.currentState.validate()){
                      showDialog(
                          context: context,
                          builder: (context) => PopUp(title: 'logando...',)
                      );
                      Navigator.pushReplacementNamed(context, '/HomePageGerencia');
                        // await validadeEmailController.ValidarLogin(
                        //     email: _emailControle.text,
                        //     senha: _senhaControle.text,
                        //     onsuccess: _onsuccess
                        // );

                        // await controllerBusca.getLogin(
                        //     email: _emailControle.text,
                        //     senha: _senhaControle.text,
                        //     onsucesso: _loginSucess
                        // );
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        )

    );
  }
}
