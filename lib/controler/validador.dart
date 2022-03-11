import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';

class ValidaCampos {
  bool pCampoVazio(String Text) {
    if (Text.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  bool pNomeInvalido(String Nome) {
    bool ExisteNum = false;
    String NomeOrig = trim(Nome);
    Nome = trim(Nome.replaceAll(' ', 'e'));
    if (!isAlpha(Nome)) {
      ExisteNum = true;
    } else {
      ExisteNum = false;
    }
    return ExisteNum;
  }

  bool pEmailValido(String Email) {
    if (isEmail(Email)) {
      return true;
    }
    return false;
  }

  bool pMaiorIgualque(String Entrada, int Tamanho) {
    if (Entrada.length >= Tamanho) {
      return true;
    }
    return false;
  }

  bool pPossuiNumero(String texto) {
    if (texto.contains(RegExp(r'[1-9]'))) {
      return true;
    }
    return false;
  }

  bool pPossuiMinusc(String texto) {
    if (texto.isNotEmpty) {
      if (texto.contains(RegExp(r'[a-z]'), 0)) {
        return true;
      }
      return false;
      ;
    }
    return false;
  }

  bool pPossuiMaiuscula(String texto) {
    if (texto.isNotEmpty) {
      if (texto.contains(RegExp(r'[A-Z]'), 0)) {
        return true;
      }
      return false;
      ;
    }
    return false;
    ;
  }
}
