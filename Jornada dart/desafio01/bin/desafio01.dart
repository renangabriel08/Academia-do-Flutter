void main() {
  //! Detalhe sobre a String
  //! A String é composta por 4 campos (Nome|Idade|Profissão|Estado onde mora)
  final pacientes = [
    'Rodrigo Rahman|35|desenvolvedor|SP',
    'Manoel Silva|12|estudante|MG',
    'Joaquim Rahman|18|estudante|SP',
    'Fernando Verne|35|estudante|MG',
    'Gustavo Silva|40|desenvolvedor|MG',
    'Sandra Silva|40|Desenvolvedor|MG',
    'Regina Verne|35|dentista|MG',
    'João Rahman|55|jornalista|SP',
  ];

  //Exercício 1
  print('1 - Apresente os pacientes com mais de 20 anos e print o nome deles');
  List<String> nomesPacientes = [];

  for (var paciente in pacientes) {
    List<String> pacienteDaVez = paciente.split('|');
    if (int.parse(pacienteDaVez[1]) > 20) {
      nomesPacientes.add(pacienteDaVez.first);
    }
  }

  print(nomesPacientes);

  //Exercício 2
  print('');
  print('2 - Apresente quantos pacientes existem para cada profissão (desenvolvedor, estudante, dentista, jornalista)');
  int devs = 0;
  int est = 0;
  int dent = 0;
  int jor = 0;

  for (var paciente in pacientes) {
    List<String> pacienteDaVez = paciente.split('|');

    switch (pacienteDaVez[2].toLowerCase()) {
      case 'desenvolvedor':
        devs++;
        break;
      case 'estudante':
        est++;
        break;
      case 'dentista':
        dent++;
        break;
      case 'jornalista':
        jor++;
        break;
    }
  }

  print('Temos $devs desenvolvedores');
  print('Temos $est estudantes');
  print('Temos $dent dentistas');
  print('Temos $jor jornalistas');
  
  //Exercício 3
  print('');
  print('3 - Apresente a quantidade de pacientes que moram em SP');
  int sp = 0;

  for (var paciente in pacientes) {
    List<String> pacienteDaVez = paciente.split('|');

    pacienteDaVez.last.toLowerCase() == 'sp' ? sp++ : null;
  }

  print('Temos $sp moradores de SP');
}
