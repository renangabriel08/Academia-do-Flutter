import 'package:desafio05/models/aluno.dart';
import 'package:desafio05/repositories/aluno_repository.dart';

void main() async {
  final alunoRepository = AlunoRepository();
  List<Aluno> alunos = await alunoRepository.buscarTodos();
  Aluno aluno = await alunoRepository.buscarPorId(1);

  print(alunos);
  print(aluno);
}
