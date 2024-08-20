void sets() {
  var numeros1 = List.generate(10, (index) => index).toSet();
  var numeros2 = {9, 4, 7, 29, 49, 6, 39};
  var numeros3 = numeros1.union(numeros2);
  
  print((numeros1.difference(numeros2)));
  print(numeros3);
}

void listas() {
  List<int> teste = [];
  List<int> numeros = List.generate(10, (index) => index);
  List<Map> produtos = [
    {'nome': 'Limão', 'preco': 10.00},
    {'nome': 'Limão', 'preco': null},
  ];
  List<String> pacientes = [
    'Renan|10',
    'Carol|34',
    'Ph|5',
    'Coelho|353',
    'Dani|25',
    'Breno|3',
  ];

  numeros.forEach((numero) {
    numero % 2 == 0 ? teste.add(numero) : null;
  });

  pacientes.sort(
    (a, b) => int.parse(a.split('|')[1]).compareTo(int.parse(b.split('|')[1])),
  );

  print(produtos.every((produto) => produto['preco'] != null));
  print(teste);
  print(pacientes);
}

void maps() {
  Map<String, String> produto = {};

  print(' ');
  print('---> Adicionando chave/valor <---');
  produto['nome'] = 'Refri';
  produto['preco'] = '10,00';
  print(produto);

  print(' ');
  print('---> Atualizando chave/valor <---');
  produto['nome'] = 'Teste';
  produto['preco'] = '101,00';
  print(produto);

  print(' ');
  print('---> Radando map com forEach <---');
  produto.forEach((key, value) => print('Chave: $key | Valor: $value'));

  print(' ');
  print('---> Radando map com forIn <---');
  for (var item in produto.entries) {
    print('Chave: ${item.key} | Valor: ${item.value}');
  }
}
