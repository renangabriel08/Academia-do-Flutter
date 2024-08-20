// Imagine que você foi contratado para desenvolver um sistema para um caixa eletrônico
// de dinheiro. Esse caixa só serve para sacar dinheiro e só funciona para 10 clientes
// por dia. Ao final de um dia, o sistema deve emitir um relatório apresentando:
// qual foi o maior valor de dinheiro sacado,
// qual a média do dinheiro sacado e
// qual foi o total de dinheiro sacado por todos os clientes naquele dia.

import 'dart:io';

void main() {
  int poltronas = 5;
  int fileiras = 5;
  List teatro = [];

  print('Escolha uma cadeira: (F1, P1)');
  String escolha = stdin.readLineSync() ?? 'F1, P1';
  escolha.toLowerCase().replaceAll(' ', '');

  for (int i = 1; i <= fileiras; i++) {
    List fileira = [];

    for (int e = 1; e <= poltronas; e++) {
      if (i.toString() == escolha[1] && e.toString() == escolha[4]) {
        fileira.add(1);
      } else {
        fileira.add(0);
      }
    }

    teatro.add(fileira);
  }

  print('---- PALCO ----');
  for (int i = 0; i < fileiras; i++) {
    print(teatro[i]);
  }
  print('---- SAÍDA ----');
}
