import 'package:adf_cli/src/repositories/student_repository.dart';
import 'package:ansicolor/ansicolor.dart';
import 'package:args/command_runner.dart';

class FindByIdCommand extends Command {
  final StudentRepository repository;

  @override
  String get description => 'Find Student By Id';

  @override
  String get name => 'findById';

  FindByIdCommand(this.repository) {
    argParser.addOption('id', help: 'Student Id', abbr: 'i');
  }

  @override
  Future<void> run() async {
    AnsiPen bluePen = AnsiPen()..blue(bold: true);
    AnsiPen whitePen = AnsiPen()..white(bold: true);
    AnsiPen redPen = AnsiPen()..red(bold: true);
    
    if (argResults?['id'] == null) {
      print(
        redPen('Por favor, envie o id do aluno com o comando --id=0 ou -i 0'),
      );
      return;
    }

    final id = int.parse(argResults?['id']);
    print(bluePen('Aguarde, estamos buscando os alunos...'));
    final student = await repository.findById(id);

    print(whitePen('-----------------------------------------'));
    print(whitePen('Aluno(a): ${student.name}'));
    print(whitePen('-----------------------------------------'));
    print(whitePen('Nome: ${student.name}'));
    print(whitePen('Idade: ${student.age ?? 'Não informado'}'));
    print(whitePen('Cursos: '));
    student.nameCourses.forEach((curso) => print(whitePen('      $curso')));
    print(whitePen('Endereco: '));
    print(
      whitePen('     ${student.address.street} (${student.address.zipCode})'),
    );

    print(bluePen('-------------------- Fim do programa --------------------'));
  }
}
