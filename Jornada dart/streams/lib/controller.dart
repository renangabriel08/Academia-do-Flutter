import 'dart:async';

Future<void> main() async {
  print('INICIO');

  List nuns = List.generate(10, (index) => index + 1);

  // Controller, entrada e saída
  StreamController streamController = StreamController<int>.broadcast();
  var inStream = streamController.sink;
  var outSteam = streamController.stream;

  // Tratando dados de saida do Stream
  outSteam
      .skip(1)
      .where((event) => event % 2 == 0)
      .map((event) => event)
      .listen((event) {
    print('Numero retornado $event');
    print('---------------------------------');
  });

  // Entrando dados na Stream
  for (var num in nuns) {
    print('Numero enviado $num');
    inStream.add(num);
    await Future.delayed(Duration(milliseconds: 500));
  }

  // Para a stream
  streamController.close();

  print('FIM');
}
