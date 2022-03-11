import 'dart:async';

import 'package:amaurifinanceiro/controler/validador.dart';
import 'package:amaurifinanceiro/pages/cadastro/cadastro.dart';
import 'package:amaurifinanceiro/pages/cadastro/nome_cad.dart';
import 'package:amaurifinanceiro/pages/staticpage.dart';
import 'package:amaurifinanceiro/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//import 'package:gradient_textfield/gradient_textfield.dart';

class Login extends StatefulWidget {
  @override
  _LoginPage createState() => _LoginPage();
}

void Printa() {
  print('object');
}

class _LoginPage extends State<Login> {
  Timer? timer;
  late String wMsg;
  void initstate() {
    super.initState(); //initstate() = oncreate() do delphi
  }

  @override
  ValidaCampos ctrl = ValidaCampos();
  cadastro cad = cadastro();
  Util ut = new Util();
  bool _showPassword = false;
  final _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    TextEditingController email = TextEditingController();
    TextEditingController Senha = TextEditingController();
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                width: size.width,
                height: size.height,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [Colors.cyan, Colors.indigo]
                        // colors: [Colors.blueAccent, Colors.purple],
                        )),
                padding: EdgeInsets.only(
                  left: 40,
                  right: 40,
                ),
                child: LayoutBuilder(builder: (context, constraints) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(
                        height: 150,
                        width: 300,
                        child: Image.asset("assets/amauri.png"),
                      ),
                      // SizedBox(
                      // height: size.height * .05,
                      // ),

                      Form(
                          key: _formKey,
                          child: ListView(shrinkWrap: true, children: <Widget>[
                            TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Digite um Login válido';
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                    icon: Icon(IconData(0xe043,
                                        fontFamily: 'MaterialIcons')),
                                    hintText: 'E-mail',
                                    hintStyle: TextStyle(color: Colors.black12),
                                    // labelText: "LOGIN",
                                    labelStyle: TextStyle(
                                      color: Colors.amber.shade300,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    )),
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.amber.shade300,
                                    fontFamily: 'Courier_new'),
                                autocorrect: true,
                                cursorColor: Colors.amber.shade300,
                                //autofocus: true,
                                textAlignVertical: TextAlignVertical.center,
                                textAlign: TextAlign.left),

                            SizedBox(
                              height: size.height * .05,
                            ),
                            TextFormField(

                                // onTap: () {
                                // print('Clicou no textform field 1');
                                // },

                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Digite uma senha válida';
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                    icon: Icon(IconData(0xe3ae,
                                        fontFamily: 'MaterialIcons')),
                                    hintText: 'Senha',
                                    hintStyle: TextStyle(color: Colors.black12),
                                    // labelText: "SENHA",
                                    labelStyle: TextStyle(
                                      color: Colors.amber.shade300,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                    suffixIcon: GestureDetector(
                                      child: Icon(_showPassword == false
                                          ? Icons.visibility_off
                                          : Icons.visibility),
                                      onTap: () {
                                        setState(() {
                                          _showPassword = !_showPassword;
                                        });
                                      },
                                    )),
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.amber.shade300,
                                ),
                                textAlignVertical: TextAlignVertical.center,
                                textAlign: TextAlign.left,
                                obscureText:
                                    _showPassword == false ? true : false),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    height: size.height * 0.05,
                                    alignment: Alignment.centerLeft,
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                          textStyle: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10.8)),
                                      onPressed: () {
                                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>)))
                                      },
                                      child: Text("Recuperar Senha",
                                          textAlign: TextAlign.left,
                                          style: (TextStyle(
                                              color: Colors.amber.shade300))),
                                    ),
                                  ),
                                  // SizedBox(width: 153),

                                  Container(
                                    // height: 30,
                                    alignment: Alignment.centerRight,
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                          textStyle: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10.8)),
                                      onPressed: () {
                                        // navegação entre telas.

                                        Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                        builder: (context) => Nome_cad()),
                                        );
                                      },
                                      child: Text("Cadastrar",
                                          textAlign: TextAlign.right,
                                          style: (TextStyle(
                                              color: Colors.amber.shade300))),
                                    ),
                                  )
                                ]),
                            // SizedBox(height: size.height * 0.15),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  ElevatedButton(
                                      onPressed: () {
                                        // if (_formKey.currentState!.validate()) {
                                        // print(wMsg);
                                        // ut.Message(context, wMsg, 'Titulo');

                                        // Navigator.push(
                                          // context,
                                          // MaterialPageRoute(
                                              // builder: (context) => Login()),
                                        // );
                                        // } else {
                                        // nao pode entrar
                                        // }
                                        Timer(
                                            Duration(seconds: 5),
                                            () => Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      Static(),
                                                )));
                                      },
                                      child: Text("ENTRAR",
                                          style: TextStyle(
                                            color: Colors.amber,
                                            // fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                          )),
                                      style: ButtonStyle(
                                        alignment: Alignment.centerRight,

                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        )),
                                        padding: MaterialStateProperty.all(
                                          EdgeInsets.all(18),
                                        ),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Color.fromARGB(255, 43, 66,
                                                    119)), // <-- Button color
                                        overlayColor: MaterialStateProperty
                                            .resolveWith<Color?>((states) {
                                          if (states
                                              .contains(MaterialState.pressed))
                                            return Colors.amber
                                                .shade300; // <-- Splash color
                                        }),
                                      ))
                                ])
                          ])),
                    ],
                  );
                }))));
  }
}
