import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ValidaCampos {
  bool pValidaCampoNome(String Text) {
    if (Text.isEmpty) {
      return false;
    } else {
      return true;
    }
  }
}
