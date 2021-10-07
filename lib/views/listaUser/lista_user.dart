import 'package:flutter/material.dart';
class ListUser extends StatefulWidget {
  @override
  _ListUserState createState() => _ListUserState();
}

class _ListUserState extends State<ListUser> {
  List User = [];
  @override
  void initState() {
    super.initState();
    var pessoa1 = {
      'nome': 'Marcos Pereira da Silva',
      'descricao': 'Falha ao tentar realizar login',
      'canal': 'Site',
      'situacao': 'Aberto'
    };
    var pessoa2 = {
      'nome': 'Rosario Gomes da Silva',
      'descricao': 'Falha ao tentar realizar login',
      'canal': 'Mobile',
      'situacao': 'Aberto'
    };
    var pessoa3 = {
      'nome': 'Debora Nascimento Silva',
      'descricao': 'Falha ao tentar realizar login',
      'canal': 'Site',
      'situacao': 'Aberto'
    };
    User.add(pessoa1);
    User.add(pessoa2);
    User.add(pessoa3);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Usuarios'),
        backgroundColor: Colors.blue[900],
        centerTitle: true,
      ),
      body: Container(
        child: ListView.builder(
            itemCount: User.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index){
              return Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text('Nome: '),
                            Text('${User[index]['nome']}'),
                            SizedBox(
                              width: 9,
                            ),
                            Text('Canal: '),
                            Text('${User[index]['canal']}'),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 0),
                                child: Text('Descrição Chamado: ')
                            ),
                            Container(
                              width: 200,
                                child: Text('${User[index]['descricao']}', maxLines: 2,)
                            ),

                          ],
                        ),
                        Row(
                          children: [
                            Text('Situação: '),
                            Text('${User[index]['situacao']}')
                          ],
                        )

                      ],
                    ),
                  ),
              );
            }
        ),
      ),
    );
  }
}
