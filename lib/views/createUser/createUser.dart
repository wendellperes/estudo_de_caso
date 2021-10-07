import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testeapi/components/shered/app_style_bordas.dart';
import 'package:testeapi/components/widgets/button_custom.dart';
import 'package:testeapi/controllers/cadastrarUser_Controller/controller_inserir.dart';
import 'package:testeapi/controllers/viacep_Controller/viacep_Controller.dart';

class CreateUser extends StatefulWidget {
  @override
  _CreateUserState createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey                          = GlobalKey<ScaffoldState>();
  final TextEditingController _nome = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _cep = TextEditingController();
  final TextEditingController _bairro = TextEditingController();
  final TextEditingController _logradouro = TextEditingController();
  final TextEditingController _municipio = TextEditingController();
  final TextEditingController _numero = TextEditingController();
  final TextEditingController _complemento = TextEditingController();
  final TextEditingController _telefone = TextEditingController();
  final TextEditingController _senha = TextEditingController();

  final String _dataControler                    = DateTime.now().toString();
  bool _securityPassword = true;
  bool isCheckLogin;
  String UF = 'UF';

  ViaCepController viaCepController;
  ControllerInserir controllerInserir;


  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    viaCepController = Provider.of<ViaCepController>(context, listen: false);
    controllerInserir = Provider.of<ControllerInserir>(context, listen: false);
  }
  void dropChange(String val){
    UF = val;
  }
  _onsuccess( bool response){
    if (response == true){
      print(response);
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text('Cadastrando...'),
        backgroundColor: Colors.green,
      ));
      Navigator.pushReplacementNamed(context, '/HomePageGerencia');
    }else{
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text('Error ao tentar Cadastrar'),
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
                      height: 100,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text('Você mais próximo, crie uma conta e fale conosco! Sua opnião é muito importante para nos',
                    style: TextStyle(fontSize: 16, color: Colors.blue[900]),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 26.0, top:15.0, right: 26.0, bottom: 0.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: _nome,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: 'Nome*',
                              labelStyle: TextStyle(
                                fontSize: 15,
                                color: Colors.black38,
                                fontWeight: FontWeight.w400,
                              ),
                              disabledBorder: disabledBorder,
                              enabledBorder: enabledBorder,
                              focusedBorder: focusedBorder,
                              border:  border,
                              errorBorder: border
                            ),
                            validator: (value){
                              if ( value.isEmpty){
                                return 'Campo nao pode ser vazio';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: _email,
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
                              errorBorder: border
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
                          Text('Endereço',
                            style: TextStyle(fontSize: 16, color: Colors.blue[900]),
                            textAlign: TextAlign.left,
                          ),
                          Container(
                            height: 100,
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: _cep,
                                    keyboardType: TextInputType.number,
                                    maxLength: 8,
                                    decoration: InputDecoration(
                                      labelText: 'Cep*',
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
                                    onChanged: (value) async {
                                      Map<String, dynamic> data;
                                      data  = await viaCepController.AuthenticationCep(cep: value);
                                      setState(() {
                                        _bairro.text = data['bairro'];
                                        dropChange(data['uf']);
                                        _logradouro.text = data['logradouro'];
                                        _municipio.text = data['localidade'];
                                        _complemento.text = data['complemento'];
                                      });
                                      // data.forEach((key, value) {
                                      //     _numero.text = value['numero'];
                                      // });
                                      print(data);
                                    },
                                    validator: (value){
                                      RegExp validarCep = new RegExp(r'^[0-9]{8}$');
                                      Iterable<Match> matches = validarCep.allMatches(_cep.text);
                                      if ( value.isEmpty){
                                        return 'Campo nao pode ser vazio';
                                      }else if( !validarCep.hasMatch(value)){
                                        return 'Informe um cep Válido';
                                      }
                                      return null;

                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(bottom: 20),
                                    child: TextFormField(
                                      controller: _numero,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        labelText: 'Numero*',
                                        labelStyle: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black38,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        disabledBorder: disabledBorder,
                                        enabledBorder: enabledBorder,
                                        focusedBorder: focusedBorder,
                                        border:  border,
                                        errorBorder: border,
                                      ),
                                      validator: (value){
                                        if ( value.isEmpty){
                                          return 'Campo nao pode ser vazio';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      width: 240,
                                      height: 50,
                                      child: Row(
                                        children: [
                                          Expanded(
                                              child: TextFormField(
                                                controller: _bairro,
                                                keyboardType: TextInputType.text,
                                                decoration: InputDecoration(
                                                  labelText: 'Bairro*',
                                                  labelStyle: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black38,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                  disabledBorder: disabledBorder,
                                                  enabledBorder: enabledBorder,
                                                  focusedBorder: focusedBorder,
                                                  border:  border,
                                                  errorBorder: border
                                                ),

                                                validator: (value){
                                                  if ( value.isEmpty){
                                                    return 'Campo nao pode ser vazio';
                                                  }
                                                  return null;
                                                },
                                              ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  children: [
                                    Container(
                                      width: 95,
                                      height: 55,
                                      child: Row(
                                        children: [
                                          Expanded(
                                              child: DropdownButtonFormField(
                                                decoration: InputDecoration(
                                                  labelText: 'UF*',
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
                                                value: UF,
                                                validator: (value){
                                                  if ( value.isEmpty){
                                                    return 'Campo nao pode ser vazio';
                                                  }
                                                  return null;
                                                },
                                                onChanged: dropChange,
                                                items: <String>['UF', 'AM', 'SP', 'BA', 'BH']
                                                    .map<DropdownMenuItem<String>>((String value){
                                                  return DropdownMenuItem<String>(
                                                    child: Text(
                                                      value,
                                                    ),
                                                    value: value,
                                                  );
                                                }).toList(),

                                              ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),

                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      width: 200,
                                      height: 60,
                                      child: Row(
                                        children: [
                                          Expanded(
                                              child: TextFormField(
                                                controller: _logradouro,
                                                keyboardType: TextInputType.text,
                                                decoration: InputDecoration(
                                                  labelText: 'Logradouro*',
                                                  labelStyle: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black38,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                  disabledBorder: disabledBorder,
                                                  enabledBorder: enabledBorder,
                                                  focusedBorder: focusedBorder,
                                                  border:  border,
                                                  errorBorder: border
                                                ),

                                                validator: (value){
                                                  if ( value.isEmpty){
                                                    return 'Campo nao pode ser vazio';
                                                  }
                                                  return null;
                                                },
                                              ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  children: [
                                    Container(
                                      width: 135,
                                      height: 55,
                                      child: Row(
                                        children: [
                                          Expanded(
                                              child: TextFormField(
                                                controller: _municipio,
                                                keyboardType: TextInputType.text,
                                                decoration: InputDecoration(
                                                  labelText: 'Municipio*',
                                                  labelStyle: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black38,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                  disabledBorder: disabledBorder,
                                                  enabledBorder: enabledBorder,
                                                  focusedBorder: focusedBorder,
                                                  border:  border,
                                                  errorBorder: border
                                                ),

                                                validator: (value){
                                                  if ( value.isEmpty){
                                                    return 'Campo nao pode ser vazio';
                                                  }
                                                  return null;
                                                },
                                              ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),

                              ],
                            ),
                          ),

                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: _complemento,
                            keyboardType: TextInputType.emailAddress,

                            decoration: InputDecoration(
                              labelText: 'Complemento*',
                              labelStyle: TextStyle(
                                fontSize: 15,
                                color: Colors.black38,
                                fontWeight: FontWeight.w400,
                              ),
                              disabledBorder: disabledBorder,
                              enabledBorder: enabledBorder,
                              focusedBorder: focusedBorder,
                              border:  border,
                              errorBorder: border
                            ),
                            validator: (value){
                              if ( value.isEmpty){
                                return 'Campo nao pode ser vazio';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: _telefone,
                            keyboardType: TextInputType.number,

                            decoration: InputDecoration(
                              labelText: 'Telefone*',
                              labelStyle: TextStyle(
                                fontSize: 15,
                                color: Colors.black38,
                                fontWeight: FontWeight.w400,
                              ),
                              disabledBorder: disabledBorder,
                              enabledBorder: enabledBorder,
                              focusedBorder: focusedBorder,
                              border:  border,
                              errorBorder: border
                            ),
                            validator: (value){
                              if ( value.isEmpty){
                                return 'Campo nao pode ser vazio';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: _senha,
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
                              errorBorder: border,

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
                  SizedBox(
                    height: 5,
                  ),
                  //montagem do butão com padding para ajustar seu tamanho
                  ButtonCustom(
                    title: 'Cadastrar',
                    ontap: () async {
                      if(_formKey.currentState.validate()){
                        await controllerInserir.Cadastrar(
                          nome: _nome.text,
                          email: _email.text,
                          cep: _cep.text,
                          numero: _numero.text,
                          bairro: _bairro.text,
                          uf: UF,
                          logradouro: _logradouro.text,
                          complemento: _complemento.text,
                          municipio: _municipio.text,
                          telefone: _telefone.text,
                          senha: _senha.text,
                          data: _dataControler,
                          onsuccess: _onsuccess
                        );
                        // await createUserController.CreateUserApi(
                        //   nome: _nome.text,
                        //   email: _email.text,
                        //   telefone: _telefone.text,
                        //   senha: _senha.text,
                        //   onsucesso: _createUserSucess
                        // );

                      }
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ButtonCustom(
                    title: 'Ja Tenho uma Conta',
                    ontap: ()  {
                      Navigator.pushNamed(context, '/LoginPage');
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
        )

    );
  }
}
