// ignore_for_file: avoid_function_literals_in_foreach_calls

void main() {
  //! Detalhe sobre a String
  //! A String é composta por 3 campos (Nome|Idade|Sexo)
  final pessoas = [
    'Rodrigo Rahman|35|Masculino',
    'Jose|56|Masculino',
    'Joaquim|84|Masculino',
    'Rodrigo Rahman|35|Masculino',
    'Maria|88|Feminino',
    'Helena|24|Feminino',
    'Leonardo|5|Masculino',
    'Laura Maria|29|Feminino',
    'Joaquim|72|Masculino',
    'Helena|24|Feminino',
    'Guilherme|15|Masculino',
    'Manuela|85|Feminino',
    'Leonardo|5|Masculino',
    'Helena|24|Feminino',
    'Laura|29|Feminino',
  ];

  //-------------------------------------------------------------------------//

  print(' ');
  print('1 - Remova os pacientes duplicados e apresente a nova lista');

  List<String> novaLista = [];
  novaLista = pessoas.toSet().toList();
  print(novaLista);

  //-------------------------------------------------------------------------//

  print(' ');
  print(
    '2 - Me mostre a quantidade de pessoas por sexo (Masculino e Feminino) e depois me apresente o nome delas',
  );

  List<Map> pessoasFormatadas = [];
  List<String> masculino = [];
  List<String> feminino = [];

  novaLista.forEach(
    (pessoa) => pessoasFormatadas.add(
      {'nome': pessoa.split('|')[0], 'sexo': pessoa.split('|')[2]},
    ),
  );

  pessoasFormatadas.forEach(
    (pessoa) => pessoa['sexo'].toLowerCase().contains('masculino')
        ? masculino.add(pessoa['nome'])
        : feminino.add(pessoa['nome']),
  );

  print('Temos ${masculino.length} homens, são eles: ${masculino.join(', ')}');
  print('Temos ${feminino.length} mulheres, são elas: ${feminino.join(', ')}');

  //-------------------------------------------------------------------------//

  print(' ');
  print(
    '3 - Filtrar e deixar a lista somente com pessoas maiores de 18 anos e apresente essas pessoas pelo nome',
  );

  List<String> maiores = [];
  novaLista.forEach((nome) {
    List format = nome.split('|');
    int.parse(format[1]) >= 18 ? maiores.add(format[0]) : null;
  });

  print('São maiores de idade ${maiores.join(', ')}');

  //-------------------------------------------------------------------------//

  print(' ');
  print('4 - Encontre a pessoa mais velha e apresente o nome dela.');
  
  List idades = [];

  novaLista.forEach((pessoa) {
    List format = pessoa.split('|');
    idades.add(format);
  });

  idades.sort((a, b) => int.parse(a[1]).compareTo(int.parse(b[1])));
  print('A pessoa mais velha é ${idades.last[0]}');
}