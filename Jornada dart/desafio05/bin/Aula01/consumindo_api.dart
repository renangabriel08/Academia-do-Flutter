import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> main() async {
  String cep = '01001000';
  Map? local = await getLocal(cep);
  print(local?['logradouro']);
}

Future<Map?> getLocal(String cep) async {
  Uri url = Uri.parse('https://viacep.com.br/ws/$cep/json/');
  final request = await http.get(url);

  if (request.statusCode == 200) {
    final res = jsonDecode(request.body);
    return res as Map;
  } else {
    print('Erro ao retornar dados');
    return null;
  }
}
