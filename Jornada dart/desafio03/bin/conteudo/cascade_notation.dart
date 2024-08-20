class Pessoa {
  String? nome;
  String? email;
  int? idade;
  String? genero;
}

void main() {
  var pessoa = Pessoa()
    ..email = 'renan@gmail.com'
    ..nome = 'Renan'
    ..genero = 'Masculino'
    ..idade = 17;

  print(pessoa.nome);
}
