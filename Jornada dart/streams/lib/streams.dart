Future<void> main() async {
  print('INICIO');

  //Inicio minha Stream que recebe um evento a cada 2 segundos
  var stream = Stream.periodic(Duration(seconds: 1), callback);

  //Cancela o Stream após 5 valores recebidos, dando fim ao await for
  stream = stream.take(3);

  //Limita a execução do Stream em 5, mas pula os 2 + 1 primeiros valores
  stream = stream.take(5).skip(2);

  //Limita a execução do Stream em 5, mas pula os valores enquanto retornar true
  stream = stream.take(5).skipWhile((int num) => num < 5);

  //Cancela o Stream quando o callback retornar true (num = valor de saida do Stream)
  stream = stream.takeWhile((int num) => num < 10);

  //Crio um for infinito, mas que só é chamado quando o Stream recebe algo, recebendo os dados um por um e parando o resto da execução
  await for (int i in stream) {
    print(i);
  }

  //Recebe todos dados do Stream de uma vez, na ordem em que foi recebido
  final data = await stream.toList();
  print(data);

  print('FIM');
}

//O que é executado quando o Stream é chamado
int callback(int value) {
  return (value + 1) * 2;
}
