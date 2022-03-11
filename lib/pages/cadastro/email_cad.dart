import 'dart:ffi';

import 'package:amaurifinanceiro/controler/validador.dart';
import 'package:amaurifinanceiro/pages/cadastro/senha_cad.dart';
import 'package:amaurifinanceiro/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';

class Email_cad extends StatefulWidget {
  @override
  _nomecadastro createState() => _nomecadastro();
}

class _nomecadastro extends State<Email_cad> {
  final _formKey = GlobalKey<FormState>();
  void initstate() {
    super.initState();
  }

  Util ut = Util();
  ValidaCampos valida = ValidaCampos();
  bool _validemail = false;
  bool _fieldsnull = true;

  TextEditingController Ctrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.only(
        top: 1,
        left: 40,
        right: 40,
      ),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.cyan, Color.fromARGB(255, 22, 46, 185)]
              // colors: [Colors.blueAccent, Colors.purple],
              )),
      child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 125,
              ),
              TextFormField(
                  validator: (value) {
                    if (!_fieldsnull && _validemail) {
                      return null;
                    } else {
                      return '';
                    }
                  },
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.amber.shade300,
                      fontFamily: 'Courier_new'),
                  // autofocus: true,
                  onChanged: (value) {
                    // _numerodigitado
                    setState(() {
                      _validemail = valida.pEmailValido(Ctrl.text);
                      _fieldsnull = valida.pCampoVazio(Ctrl.text);
                    });
                  },
                  decoration: InputDecoration(
                    labelText: "E-mail",
                    labelStyle: TextStyle(
                      color: Colors.amber.shade300,
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                    ),
                    // suffixIcon: Padding(
                    // padding: const EdgeInsetsDirectional.only(top: 20),
                    // child: Icon(
                    // (_fieldsnull || !_validemail)
                    // ? Icons.warning
                    // : Icons.check,
                    // size: 18,
                    // ), // myIcon is a 48px-wide widget.
                  ),
                  controller: Ctrl),
              Column(children: <Widget>[
                Container(
                  height: 280,
                  alignment: Alignment.centerRight,
                  child: ListView(
                    children: <Widget>[
                      SizedBox(
                        height: 13,
                      ),
                      ListTile(
                        //enabled: !_fieldsnull,
                        leading: Icon(_fieldsnull == false
                            ? Icons.check_circle
                            : Icons.error),

                        iconColor: _fieldsnull == false
                            ? Color.fromARGB(255, 50, 250, 56)
                            : Colors.amber.shade300,
                        title: Text(
                          'Campo obrigatório',
                          style: TextStyle(fontSize: 12),
                          textAlign: TextAlign.start,
                        ),
                        textColor: _fieldsnull == false
                            ? Color.fromARGB(255, 50, 250, 56)
                            : Colors.amber.shade300,
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      /* ListTile(
                        leading: Icon(
                          Icons.warning,
                          size: 25,
                        ),
                        iconColor: Colors.amber.shade300,
                        title: Text(
                          '',
                          style: TextStyle(fontSize: 12),
                          textAlign: TextAlign.start,
                        ),
                        textColor: Colors.amber.shade300,
                      ),
                      SizedBox(
                        height: 13,
                      ),*/
                      ListTile(
                        leading: Icon(_validemail == false
                            ? Icons.error
                            : Icons.check_circle),
                        iconColor: _validemail == true
                            ? Color.fromARGB(255, 50, 250, 56)
                            : Colors.amber.shade300,
                        title: Text(
                          _validemail == true
                              ? 'E-mail Válido'
                              : 'E-mail Inválido',
                          style: TextStyle(fontSize: 12),
                          textAlign: TextAlign.start,
                        ),
                        textColor: _validemail == true
                            ? Color.fromARGB(255, 50, 250, 56)
                            : Colors.amber.shade300,
                      ),
                    ],
                  ), //Text(_nomecadastro == null ? "" : "qweqwe")
                  // child: TextButton(
                  //   style: TextButton.styleFrom(
                  //       textStyle: TextStyle(
                  //           color: Colors.black,
                  //           fontWeight: FontWeight.bold,
                  //           fontSize: 10.8)),
                  //   onPressed: () {
                  //     // Navigator.push(context, MaterialPageRoute(builder: (context)=>)))
                  //   },
                  //   child: Text("Recuperar Senha",
                  //       textAlign: TextAlign.left,
                  //       style: (TextStyle(color: Colors.amber.shade300))),
                  // ),

                  // child: TextButton(
                  //   style: TextButton.styleFrom(
                  //       textStyle: TextStyle(
                  //           color: Colors.black,
                  //           fontWeight: FontWeight.bold,
                  //           fontSize: 10.8)),
                  //   onPressed: () {
                  //     // navegação entre telas.

                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(builder: (context) => Nome_cad()),
                  //     );
                  //   },
                  //   child: Text("Cadastrar",
                  //       textAlign: TextAlign.right,
                  //       style: (TextStyle(color: Colors.amber.shade300))),
                  // ),
                ),
              ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Senha_cad()));
                          } else {
                            ut.Message(
                                context,
                                "Voce NAO Logou em  amauri financeiro ",
                                "Parabéns FODASE");
                          }
                        },
                        child: Icon(
                          IconData(0xe09b,
                              fontFamily: 'MaterialIcons',
                              matchTextDirection: true),
                        ),
                        style: ButtonStyle(
                          alignment: Alignment.centerRight,
                          shape: MaterialStateProperty.all(
                            CircleBorder(),
                          ),
                          padding: MaterialStateProperty.all(
                            EdgeInsets.all(18),
                          ),
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(
                                  255, 43, 66, 119)), // <-- Button color
                          overlayColor:
                              MaterialStateProperty.resolveWith<Color?>(
                                  (states) {
                            if (states.contains(MaterialState.pressed))
                              return Colors.amber.shade300; // <-- Splash color
                          }),
                        ))
                  ])
            ],
          )),
    ));
  }
}
