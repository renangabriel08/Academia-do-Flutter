import 'dart:io';
import 'package:adf_cli/src/repositories/student_repository.dart';
import 'package:ansicolor/ansicolor.dart';
import 'package:args/command_runner.dart';

class DeleteCommand extends Command {
  final StudentRepository repository;

  @override
  String get description => 'Delete Studente By ID';

  @override
  String get name => 'delete';

  DeleteCommand(this.repository) {
    argParser.addOption('id', help: 'Student ID', abbr: 'i');
  }

  @override
  Future<void> run() async {
    AnsiPen bluePen = AnsiPen()..blue(bold: true);
    AnsiPen redPen = AnsiPen()..red(bold: true);

    if (argResults!['id'] == null) {
      print(
        redPen('Por favor, informe o id do aluno com o comando --id=0 ou -i 0'),
      );
      return;
    }

    for (int i = 0; i < argResults!['id'].length; i++) {
      if (!argResults!['id'][i].contains(RegExp(r'[0-9]'))) {
        print(redPen('Por favor, informe apenas numeros no id'));
        return;
      }
    }

    final student = await repository.findById(int.parse(argResults!['id']));
    print(redPen('Deseja realmente deletar o aluno ${student.name}? (S ou N)'));

    final confirmDelete = stdin.readLineSync();

    if (confirmDelete!.toLowerCase() == 's') {
      repository.deleteById(int.parse(argResults!['id']));
      print(bluePen('Aluno(a) ${student.name} deletado com sucesso'));
      return;
    }

    if (confirmDelete.toLowerCase() == 'n') {
      print(redPen('Operação cancelada!'));
      return;
    }

    print(redPen('Responda com S ou N'));
    return;
  }
}
