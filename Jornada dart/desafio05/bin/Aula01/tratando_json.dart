import 'dart:convert';

void main() {
  final jsonCEP = '''
    {
      "cep": "01001-000",
      "logradouro": "Praça da Sé",
      "complemento": "lado ímpar",
      "unidade": "",
      "bairro": "Sé",
      "localidade": "São Paulo",
      "uf": "SP",
      "ibge": "3550308",
      "gia": "1004",
      "ddd": "11",
      "siafi": "7107"
    }
  ''';

  final jsonData = jsonDecode(jsonCEP);
  Local local = Local(
    cep: jsonData['cep'],
    logradouro: jsonData['logradouro'],
    complemento: jsonData['complemento'],
    unidade: jsonData['unidade'],
    bairro: jsonData['bairro'],
    localidade: jsonData['localidade'],
    uf: jsonData['uf'],
    gia: jsonData['gia'],
    ddd: jsonData['ddd'],
    siafi: jsonData['siafi'],
  );

  print(local.bairro);
}

class Local {
  final String cep;
  final String logradouro;
  final String complemento;
  final String unidade;
  final String bairro;
  final String localidade;
  final String uf;
  final String gia;
  final String ddd;
  final String siafi;

  Local({
    required this.cep,
    required this.logradouro,
    required this.complemento,
    required this.unidade,
    required this.bairro,
    required this.localidade,
    required this.uf,
    required this.gia,
    required this.ddd,
    required this.siafi,
  });
}
