import 'dart:io';
import 'package:adf_cli/src/models/address.dart';
import 'package:adf_cli/src/models/city.dart';
import 'package:adf_cli/src/models/phone.dart';
import 'package:adf_cli/src/models/student.dart';
import 'package:adf_cli/src/repositories/product_repository.dart';
import 'package:adf_cli/src/repositories/student_repository.dart';
import 'package:ansicolor/ansicolor.dart';
import 'package:args/command_runner.dart';

class InsertCommand extends Command {
  final StudentRepository studentRepository;
  final productRepository = ProductRepository();

  @override
  String get description => 'Insert New Student';

  @override
  String get name => 'insert';

  InsertCommand(this.studentRepository) {
    argParser.addOption('file', help: 'Path of the csv file', abbr: 'f');
  }

  @override
  Future<void> run() async {
    AnsiPen bluePen = AnsiPen()..blue(bold: true);

    print(bluePen('Aguarde...'));

    //Lendo arquivo csv
    final filePath = argResults?['file'];
    final students = File(filePath).readAsLinesSync();

    for (var student in students) {
      final studentData = student.split(';');
      final courseCsv = studentData[2].split(',').map((e) => e.trim()).toList();

      final courseFutures = courseCsv.map((c) async {
        final course = await productRepository.findByName(c);
        course.isStudent = true;
        return course;
      }).toList();

      final courses = await Future.wait(courseFutures);

      final studentModel = Student(
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

      await studentRepository.insert(studentModel);
    }
    print(bluePen('Alunos adicionados com sucesso!'));
  }
}
