class Validator {
  bool caracteres = false;
  bool maiuscula = false;
  bool numero = false;
  bool especial = false;
  bool igual = false;
  bool senhaValida = false;

  void validarSenha() {
    if (caracteres && maiuscula && numero && especial && igual) {
      senhaValida = true;
    } else {
      senhaValida = false;
    }
  }

  void tudoFalso(String senha) {
    caracteres = false;
    maiuscula = false;
    numero = false;
    especial = false;
    senhaValida = false;
  }

  void validarCarac(String senha) {
    senha.length >= 8 ? caracteres = true : caracteres = false;
  }

  void validarIgual(String senha, String cSenha) {
    senha == cSenha ? igual = true : igual = false;
  }

  void validarNum(String senha) {
    for (int i = 0; i < senha.length; i++) {
      if (senha[i].contains(RegExp(r'[0-9]'))) {
        numero = true;
        break;
      } else {
        numero = false;
      }
    }
  }

  void validarMaiuscula(String senha) {
    for (int i = 0; i < senha.length; i++) {
      if (senha[i].contains(RegExp(r'[A-Z]'))) {
        maiuscula = true;
        break;
      } else {
        maiuscula = false;
      }
    }
  }

  void validarEspecial(String senha) {
    for (int i = 0; i < senha.length; i++) {
      if (!senha[i].contains(RegExp(r'[A-Z]')) &&
          !senha[i].contains(RegExp(r'[a-z]')) &&
          // !senha[i].contains(RegExp(r'[^\u0000-\u007F]')) &&
          !senha[i].contains(RegExp(r'[0-9]'))) {
        especial = true;
        break;
      } else {
        especial = false;
      }
    }
  }
}
