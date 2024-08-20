Future<void> main() async {
  print('INICIO');
  var stream = Stream.periodic(Duration(seconds: 1), callback);

  //Adiciona mais de um ouvinte na Stream
  stream = stream.asBroadcastStream();

  //Retorna os 3 primeiros eventos que atenda o where
  stream = stream.where((event) => event % 6 == 0).take(3);

  stream.listen((event) => print(event));
  stream.listen((event) => print(event));

  print('FIM');
}

int callback(int value) {
  return (value + 1) * 2;
}
