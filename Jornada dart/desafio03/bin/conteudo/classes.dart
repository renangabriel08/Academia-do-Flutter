// Atributos/Variáveis
// Metodos/Comportamentos/Funções

class Pessoa {
  // Atributos de instância
  String? nome;
  String? email;
  int? idade;
  String? genero;

  // Metodos de instância
  String beber() {
    if (idade! >= 18) {
      return 'Pode beber';
    } else {
      return 'Não pode beber';
    }
  }

  //Atributos de classe
  static String nomeClasse = 'Renan';

  //Metodos de classe
  static metodoDeClasse() {
    return true;
  }
}

void main() {
  //Iniciar uma instância
  var renan = Pessoa();
  renan.nome = 'Renan';
  renan.email = 'renan@gmail.com';
  renan.idade = 17;
  renan.genero = 'Masculino';
  print(renan.beber());

  //Utilizar atributos de classe
  String nome = Pessoa.nomeClasse;
  print(nome);
}
