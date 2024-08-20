import 'dart:io';

import 'package:adf_cli/src/models/address.dart';
import 'package:adf_cli/src/models/city.dart';
import 'package:adf_cli/src/models/phone.dart';
import 'package:adf_cli/src/models/student.dart';
import 'package:adf_cli/src/repositories/product_repository.dart';
import 'package:adf_cli/src/repositories/student_repository.dart';
import 'package:ansicolor/ansicolor.dart';
import 'package:args/command_runner.dart';

class UpdateCommand extends Command {
  final StudentRepository studentRepository;
  final ProductRepository productRepository = ProductRepository();

  @override
  String get description => 'Update Student';

  @override
  String get name => 'update';

  UpdateCommand(this.studentRepository) {
    argParser.addOption('file', help: 'Path of the csv file', abbr: 'f');
    argParser.addOption('id', help: 'Student ID', abbr: 'i');
  }

  @override
  Future<void> run() async {
    AnsiPen bluePen = AnsiPen()..blue(bold: true);
    AnsiPen redPen = AnsiPen()..red(bold: true);

    print(bluePen('Validando arquivo...'));

    //Lendo arquivo csv
    final filePath = argResults?['file'];
    final id = argResults?['id'];

    if (id == null) {
      print(
        redPen('Por favor, informe o id do aluno com o comando --id=0 ou -i 0'),
      );
      return;
    }

    final students = File(filePath).readAsLinesSync();
    print(bluePen('Atualizando dados do aluno...'));

    if (students.length > 1) {
      print(redPen('Por favor, informe apenas um aluno no arquivo $filePath'));
      return;
    } else if (students.isEmpty) {
      print(redPen('Por favor, informe um aluno no arquivo $filePath'));
      return;
    }

    final student = students.first;

    final studentData = student.split(';');
    final courseCsv = studentData[2].split(',').map((e) => e.trim()).toList();

    final courseFutures = courseCsv.map((c) async {
      final course = await productRepository.findByName(c);
      course.isStudent = true;
      return course;
    }).toList();

    final courses = await Future.wait(courseFutures);

    final studentModel = Student(
      id: int.parse(id),
      name: studentData[0],
      age: int.tryParse(studentData[1]),
      nameCourses: courseCsv,
      courses: courses,
      address: Address(
        street: studentData[3],
        number: int.parse(studentData[4]),
        zipCode: studentData[5],
        city: City(id: 1, name: studentData[6]),
        phone: Phone(ddd: int.parse(studentData[7]), phone: studentData[8]),
      ),
    );

    await studentRepository.update(studentModel);

    print(bluePen('Aluno atualizado com sucesso!'));
  }
}
