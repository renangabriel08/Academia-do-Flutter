//Classe abstrata
//Classe criada COM métodos implementados
abstract class CarroAbstrato {
  void velocidadeMaxima() {}
}

//Interface
//Classe criada SEM métodos implementados
abstract class Carro {
  abstract int rodas;
  abstract int portas;
  abstract String motor;

  int velocidadeMaxima();
}

class Uno implements Carro {
  @override
  String motor = '2.0';

  @override
  int portas = 4;

  @override
  int rodas = 4;

  @override
  int velocidadeMaxima() {
    return 200;
  }
}

class Gol implements Carro {
  @override
  String motor = '2.0';

  @override
  int portas = 4;

  @override
  int rodas = 4;

  @override
  int velocidadeMaxima() {
    return 200;
  }

  String tipoDeRodas = 'Esportivas';
}

void main() {
  Carro uno = Uno();
  Carro gol = Gol();

  print(uno.runtimeType);
  // print(gol.tipoDeRodas); -> Erro pq o método ser apenas do filho e a variável ser do tipo do pai

  // Verificamos o tipo do filho
  // Se for ele coverte(cast) para o filho, permitindo acessar métodos do filho
  if (gol is Gol) {
    print(gol.tipoDeRodas);
  } else {
    print('Esse tipo de carro não possui tipos de rodas');
  }
}
