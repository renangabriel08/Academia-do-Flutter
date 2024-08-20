// Serve para herdar mais de uma classe
// Pode adicionar condição de quam ele pode ir junto
// Não pode extender

// Classes PAI
abstract class Pessoa {
  String andar() {
    return 'Andando...';
  }
}

mixin Dev on Pessoa {
  String programar() {
    return 'Programando...';
  }
}

class Renan extends Pessoa with Dev {}

void main() {
  var renan = Renan();

  print(renan.programar());
  print(renan.andar());
}
