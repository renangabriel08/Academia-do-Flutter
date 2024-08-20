import 'package:desafio_senha/validators/validator.dart';
import 'package:desafio_senha/widgets/requisitos.dart';
import 'package:flutter/material.dart';

class Senha extends StatefulWidget {
  const Senha({super.key});

  @override
  State<Senha> createState() => _SenhaState();
}

class _SenhaState extends State<Senha> {
  final formKey = GlobalKey<FormState>();
  final senha = TextEditingController();
  final cSenha = TextEditingController();

  bool obscureText1 = true;
  bool obscureText2 = true;

  Validator validator = Validator();

  validar() {
    if (senha.text.isEmpty) {
      validator.tudoFalso(senha.text);
    } else {
      validator.validarCarac(senha.text);
      validator.validarEspecial(senha.text);
      validator.validarNum(senha.text);
      validator.validarMaiuscula(senha.text);
    }
    validator.validarIgual(senha.text, cSenha.text);
    validator.validarSenha();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(height: height * .05),

              //Header
              const Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Defina uma senha',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Uma senha forte ajuda a manter sua conta segura',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: height * .05),

              //Form
              Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: senha,
                      onChanged: (value) => validar(),
                      obscureText: obscureText1,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                          onPressed: () => setState(
                            () => obscureText1 = !obscureText1,
                          ),
                          icon: Icon(
                            obscureText1
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: 'Senha',
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: cSenha,
                      obscureText: obscureText2,
                      onChanged: (value) => validar(),
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                          onPressed: () => setState(
                            () => obscureText2 = !obscureText2,
                          ),
                          icon: Icon(
                            obscureText2
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: 'Confirmar Senha',
                      ),
                    ),
                    SizedBox(height: height * .05),
                    Column(
                      children: [
                        const Row(
                          children: [
                            Text(
                              'SUA SENHA DEVE CONTER',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Requisitos(
                          cor: validator.caracteres ? Colors.green : Colors.red,
                          txt: '8 caracteres',
                        ),
                        Requisitos(
                          cor: validator.maiuscula ? Colors.green : Colors.red,
                          txt: '1 letra maiúscula',
                        ),
                        Requisitos(
                          cor: validator.numero ? Colors.green : Colors.red,
                          txt: '1 ou mais números',
                        ),
                        Requisitos(
                          cor: validator.especial ? Colors.green : Colors.red,
                          txt: '1 ou mais caracteres especiais',
                        ),
                        Requisitos(
                          cor: validator.igual ? Colors.green : Colors.red,
                          txt: 'Senha igual a confirmar senha',
                        ),
                      ],
                    ),
                    SizedBox(height: height * .05),
                    Visibility(
                      visible: !validator.senhaValida,
                      replacement: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(width, 50),
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Sua senha foi definida com sucesso!',
                              ),
                            ),
                          );
                        },
                        child: const Text(
                          'Confirmar minha senha',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(width, 50),
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Sua senha não atende todos requisitos',
                              ),
                            ),
                          );
                        },
                        child: const Text(
                          'Senha não aprovada',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
