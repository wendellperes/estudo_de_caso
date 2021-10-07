import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testeapi/components/shered/app_colors.dart';
import 'package:testeapi/components/shered/app_style_bordas.dart';
import 'package:testeapi/components/widgets/button_custom.dart';
import 'package:testeapi/components/widgets/popup.dart';

class ValidarEmail extends StatefulWidget {
  @override
  _ValidarEmailState createState() => _ValidarEmailState();
}

class _ValidarEmailState extends State<ValidarEmail> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey                          = GlobalKey<ScaffoldState>();
  final TextEditingController _emailControle = TextEditingController();
  bool isCheckEmail = false;

  // ValidadeEmailController validadeEmailController;


  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    // validadeEmailController = Provider.of<ValidadeEmailController>(context, listen: false);
  }
  _validarEmail( bool response){
    if (response == true){
      Navigator.pop(context);
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text('Validando...'),
        backgroundColor: Colors.green,
      ));
      Navigator.pushReplacementNamed(context, '/LoginPage');
    }else{
      Navigator.pop(context);
      isCheckEmail = false;
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text('Email Inválidos...'),
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
                      'images/logo-teste2.jpg',
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
                                  color: AppColors.darkGreen),
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
                            builder: (context) => PopUp(title: 'Validando e-mail...',)
                        );
                        // await validadeEmailController.ValidadeEmailApi(email: _emailControle.text, onsuccess: _validarEmail);


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
