class Usuario {
  //será mudado para produtos
  int id = 0;
  String name         = '';
  String email        = '';
  String cep          = '';
  String numero       = '';
  String bairro       = '';
  String uf           = '';
  String logradouro   = '';
  String municipio    = '';
  String complemento  = '';
  String telefone     = '';
  String senha        = '';
  String data_criacao = '';

  Usuario({
    this.id, 
    this.name, 
    this.email,  
    this.cep,  
    this.numero,  
    this.bairro,  
    this.uf,  
    this.logradouro,  
    this.municipio,  
    this.complemento,  
    this.telefone,  
    this.senha,  
    this.data_criacao, 
    });

  Map<String, dynamic>toMap(){
    return{
      'id': id,
      'nome': name,
      'email': email,
      'cep': cep,
      'numero': numero,
      'bairro': bairro,
      'uf': uf,
      'logradouro': logradouro,
      'municipio': municipio,
      'complemento': complemento,
      'telefone': telefone,
      'senha': senha,
      'data_cadastro': data_criacao
    };
  }

}