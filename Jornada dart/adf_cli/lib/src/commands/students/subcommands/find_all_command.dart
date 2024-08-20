import 'package:adf_cli/src/repositories/student_repository.dart';
import 'package:ansicolor/ansicolor.dart';
import 'package:args/command_runner.dart';
import 'dart:io';

class FindAllCommand extends Command {
  final StudentRepository repository;

  @override
  String get description => 'Find all Students';

  @override
  String get name => 'findAll';

  FindAllCommand(this.repository);

  @override
  void run() async {
    AnsiPen bluePen = AnsiPen()..blue(bold: true);
    AnsiPen whitePen = AnsiPen()..white(bold: true);
    print(bluePen('Aguarde, estamos buscando os alunos...'));
    final students = await repository.findAll();

    if (students.isEmpty) {
      print(bluePen('Nenhum aluno cadastrado no sistema'));
      return;
    }

    print(bluePen('Deseja apresentar também os cursos? (S ou N)'));

    final showCourses = stdin.readLineSync();
    print(bluePen('-----------------------------------------'));
    print(bluePen('Alunos: '));
    print(bluePen('-----------------------------------------'));

    for (var student in students) {
      if (showCourses?.toLowerCase() == 's') {
        print(
          whitePen(
            '${student.id} - ${student.name} ${student.courses.where((course) => course.isStudent).map((e) => e.name).toList()}',
          ),
        );
      } else {
        print(whitePen('${student.id} - ${student.name}'));
      }
    }

    print(bluePen('-------------------- Fim do programa --------------------'));
  }
}
