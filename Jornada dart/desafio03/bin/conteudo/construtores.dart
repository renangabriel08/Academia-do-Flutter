class Pessoa {
  // Atributos
  String? nome;
  int? idade;
  String? sexo;

  // Construtor recebendo parametros e setando atributos
  Pessoa({required this.nome, required this.idade, required this.sexo});
  Pessoa.semNome({required this.idade, required this.sexo});
}

void main() {
  Pessoa renan = Pessoa(nome: 'Renan', idade: 17, sexo: 'masculino');
  Pessoa renanSemNome = Pessoa.semNome(idade: 17, sexo: 'masculino');

  print(renan.nome);
  print(renanSemNome.nome);
}
