import 'package:amaurifinanceiro/carregamento.dart';
import 'package:amaurifinanceiro/controler/controle_cadastro.dart';
import 'package:amaurifinanceiro/controler/validador.dart';
import 'package:amaurifinanceiro/pages/cadastro/email_cad.dart';
import 'package:amaurifinanceiro/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';

class Senha_cad extends StatefulWidget {
  final controle_cadastro ctrl;

  Senha_cad(this.ctrl);
  @override
  _senhacadastro createState() => _senhacadastro();
}

class _senhacadastro extends State<Senha_cad> {
  //declara variáveis
  bool _versenha = false;
  bool _fieldsnull = true;
  late String Senha = ' ';

  final _formKey = GlobalKey<FormState>();

  ValidaCampos valida = ValidaCampos();
  TextEditingController ControleSenha = TextEditingController();
  void initstate() {
    super.initState();
  }

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
                          if (!_fieldsnull &&
                              !valida.pCampoVazio(Senha) &&
                              valida.pMaiorIgualque(Senha, 8) &&
                              (valida.pPossuiMaiuscula(Senha) &&
                                  valida.pPossuiMinusc(Senha) &&
                                  valida.pPossuiNumero(Senha))) {
                            return null;
                          } else {
                            return '';
                          }
                        },
                        controller: ControleSenha,
                        onChanged: (value) {
                          setState(() {
                            Senha = ControleSenha.text;
                            _fieldsnull =
                                valida.pCampoVazio(ControleSenha.text);
                          });
                        },
                        obscureText: _versenha,
                        //      validator: (value) {
                        //   if (!_fieldsnull && _validemail) {
                        //     return null;
                        //   } else {
                        //     return '';
                        //   }
                        // },
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.amber.shade300,
                            fontFamily: 'Courier_new'),
                        // autofocus: true,
                        // onChanged: (value) {
                        // _numerodigitado
                        //   setState(() {
                        //     _validemail = valida.pEmailValido(Ctrl.text);
                        //     _fieldsnull = valida.pCampoVazio(Ctrl.text);
                        //   });
                        // },
                        decoration: InputDecoration(
                            labelText: "Senha",
                            labelStyle: TextStyle(
                              color: Colors.amber.shade300,
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                            ),
                            suffixIcon: GestureDetector(
                              child: Icon(
                                _versenha
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                size: 18,
                              ),
                              onTap: () {
                                setState(() {
                                  _versenha = !_versenha;
                                });
                              },
                            ))
                        // suffixIcon: Padding(
                        // padding: const EdgeInsetsDirectional.only(top: 20),
                        // child: Icon(
                        // (_fieldsnull || !_validemail)
                        // ? Icons.warning
                        // : Icons.check,
                        // size: 18,
                        // ), // myIcon is a 48px-wide widget.
                        ),
                    Column(children: <Widget>[
                      Container(
                          height: 280,
                          alignment: Alignment.centerRight,
                          child: ListView(children: <Widget>[
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
                            ListTile(
                              //enabled: !_fieldsnull,
                              leading: Icon(
                                  valida.pMaiorIgualque(Senha, 8) == true
                                      ? Icons.check_circle
                                      : Icons.error),

                              iconColor: valida.pMaiorIgualque(Senha, 8) == true
                                  ? Color.fromARGB(255, 50, 250, 56)
                                  : Colors.amber.shade300,
                              title: Text(
                                'Pelo menos 8 caracteres',
                                style: TextStyle(fontSize: 12),
                                textAlign: TextAlign.start,
                              ),
                              textColor: valida.pMaiorIgualque(Senha, 8)
                                  ? Color.fromARGB(255, 50, 250, 56)
                                  : Colors.amber.shade300,
                            ),
                            ListTile(
                              //enabled: !_fieldsnull,
                              leading: Icon(valida.pPossuiNumero(Senha) == true
                                  ? Icons.check_circle
                                  : Icons.error),

                              iconColor: valida.pPossuiNumero(Senha) == true
                                  ? Color.fromARGB(255, 50, 250, 56)
                                  : Colors.amber.shade300,
                              title: Text(
                                'Pelo menos um número',
                                style: TextStyle(fontSize: 12),
                                textAlign: TextAlign.start,
                              ),
                              textColor: valida.pPossuiNumero(Senha) == true
                                  ? Color.fromARGB(255, 50, 250, 56)
                                  : Colors.amber.shade300,
                            ),
                            ListTile(
                              //enabled: !_fieldsnull,
                              leading: Icon(
                                  valida.pPossuiMaiuscula(Senha) == true
                                      ? Icons.check_circle
                                      : Icons.error),

                              iconColor: valida.pPossuiMaiuscula(Senha) == true
                                  ? Color.fromARGB(255, 50, 250, 56)
                                  : Colors.amber.shade300,
                              title: Text(
                                'Uma letra maiúscula',
                                style: TextStyle(fontSize: 12),
                                textAlign: TextAlign.start,
                              ),
                              textColor: valida.pPossuiMaiuscula(Senha) == true
                                  ? Color.fromARGB(255, 50, 250, 56)
                                  : Colors.amber.shade300,
                            ),
                            ListTile(
                              //enabled: !_fieldsnull,
                              leading: Icon(valida.pPossuiMinusc(Senha) == true
                                  ? Icons.check_circle
                                  : Icons.error),

                              iconColor: valida.pPossuiMinusc(Senha) == true
                                  ? Color.fromARGB(255, 50, 250, 56)
                                  : Colors.amber.shade300,
                              title: Text(
                                'Uma letra minúscula',
                                style: TextStyle(fontSize: 12),
                                textAlign: TextAlign.start,
                              ),
                              textColor: valida.pPossuiMinusc(Senha) == true
                                  ? Color.fromARGB(255, 50, 250, 56)
                                  : Colors.amber.shade300,
                            )
                          ])),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    // Navigator.push(
                                    // context,
                                    // MaterialPageRoute(
                                    // builder: (context) => Email_cad()),
                                    // );
                                    widget.ctrl.setCodigo(250);
                                    widget.ctrl.setSenha(ControleSenha.text);
                                    widget.ctrl.SaveCadAmauri();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => SplashScreen(
                                              widget.ctrl.GetNomeUsuario(21)),
                                        ));
                                  } else {
                                    // nao pode entrar
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
                                      Color.fromARGB(255, 43, 66,
                                          119)), // <-- Button color
                                  overlayColor:
                                      MaterialStateProperty.resolveWith<Color?>(
                                          (states) {
                                    if (states.contains(MaterialState.pressed))
                                      return Colors
                                          .amber.shade300; // <-- Splash color
                                  }),
                                ))
                          ])
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
                      //     ListTile(
                      //       leading: Icon(_validemail == false
                      //           ? Icons.error
                      //           : Icons.check_circle),
                      //       iconColor: _validemail == true
                      //           ? Color.fromARGB(255, 50, 250, 56)
                      //           : Colors.amber.shade300,
                      //       title: Text(
                      //         _validemail == true
                      //             ? 'E-mail Válido'
                      //             : 'E-mail Inválido',
                      //         style: TextStyle(fontSize: 12),
                      //         textAlign: TextAlign.start,
                      //       ),
                      //       textColor: _validemail == true
                      //           ? Color.fromARGB(255, 50, 250, 56)
                      //           : Colors.amber.shade300,
                      //     ),
                      //   ],
                      // ), //Text(_nomecadastro == null ? "" : "qweqwe")
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
                    ])
                  ],
                ))));
  }
}
