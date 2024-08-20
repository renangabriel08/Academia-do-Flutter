Future<void> main() async {
  print('INICIO');

  var stream = Stream.periodic(Duration(seconds: 1), callback);
  stream = stream.take(5);

  //Fica escutando o Stream, mas sem parar o resto da execução
  stream.listen((event) => print(event));

  print('FIM');
}

int callback(int value) {
  return (value + 1) * 2;
}
