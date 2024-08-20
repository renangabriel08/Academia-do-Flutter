abstract class Animal {
  final String nome;
  final int idade;
  int calcularIdadeHumana();

  Animal({required this.nome, required this.idade});
}

class Cachorro extends Animal {
  Cachorro({required super.nome, required super.idade});

  @override
  int calcularIdadeHumana() {
    return idade * 7;
  }
}

void main() {
  final teo = Cachorro(nome: 'Teo', idade: 10);

  print(teo.nome);
  print(teo.idade);
  print(teo.calcularIdadeHumana());
}
