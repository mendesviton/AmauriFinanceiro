import 'dart:ui';

import 'package:amaurifinanceiro/controler/validador.dart';
import 'package:amaurifinanceiro/pages/cadastro.dart';
import 'package:amaurifinanceiro/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//import 'package:gradient_textfield/gradient_textfield.dart';

class LoginPage extends StatelessWidget {
  @override
  ValidaCampos ctrl = ValidaCampos();

  cadastro cad = cadastro();
  Util ut = new Util();

  final _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController Senha = TextEditingController();
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.cyan, Colors.indigo]
              // colors: [Colors.blueAccent, Colors.purple],
              )),
      padding: EdgeInsets.only(
        top: 1,
        left: 40,
        right: 40,
      ),
      //color: Color.fromARGB(255, 128, 183, 234),
      child: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            SizedBox(
              width: 100,
              height: 200,
              child: Image.asset("assets/amauri.png"),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
                
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Digite um Login válido';
                  }
                  return null;
                },
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                    icon: Icon(IconData(0xe043, fontFamily: 'MaterialIcons')),
                    // labelText: "LOGIN",
                    labelStyle: TextStyle(
                      color: Colors.amber.shade300,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    )),
                style: TextStyle(fontSize: 20, color: Colors.black),
                autocorrect: true,
                cursorColor: Colors.black,
                //autofocus: true,
                textAlignVertical: TextAlignVertical.center,
                textAlign: TextAlign.center
                ),
            SizedBox(
              height: 20,
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
                  icon: Icon(IconData(0xe3ae, fontFamily: 'MaterialIcons')),
                  // labelText: "SENHA",
                  labelStyle: TextStyle(
                    color: Colors.amber.shade300,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  )),
              style: TextStyle(
                fontSize: 20,
                color: Colors.amber.shade300,
              ),
              textAlignVertical: TextAlignVertical.center,
              textAlign: TextAlign.center,
              obscureText: true,
            ),
            SizedBox(
              height: 20,
            ),
            Row(children: <Widget>[
              Container(
                height: 30,
                alignment: Alignment.centerRight,
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
                      style: (TextStyle(color: Colors.amber.shade300))),
                ),
              ),
              SizedBox(width: 117),
              Container(
                height: 30,
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
                      MaterialPageRoute(builder: (context) => cadastro()),
                    );
                  },
                  child: Text("Cadastrar",
                      textAlign: TextAlign.right,
                      style: (TextStyle(color: Colors.amber.shade300))),
                ),
              )
            ]),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // ut.Message(context, "Voce Logou em  amauri financeiro ",
                      // "Parabéns");
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    } else {}
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0),
                  ),
                  padding: const EdgeInsets.all(0.0),
                  
                  child: 
                   
                  Ink(
                    decoration: const BoxDecoration(
                      
                      gradient: RadialGradient(colors: [
                        /*   layout amarelo 
                        Color.fromARGB(255, 247, 195, 25),
                        Color.fromARGB(255, 235, 207, 116),
                        Color.fromARGB(255, 255, 234, 165),
                        Color.fromARGB(255, 255, 234, 165),
                        Color.fromARGB(255, 235, 207, 116),
                        Color.fromARGB(255, 247, 195, 25),*/
                        // layout azul
                        Color.fromARGB(255, 43, 66, 119),
                        Color.fromARGB(255, 43, 66, 119),
                      ], radius: 1),
                      borderRadius: BorderRadius.all(Radius.circular(80.0)),
                    ),
                    child: Container(
                      constraints: const BoxConstraints(
                          minWidth: 98.0,
                          minHeight: 40.0), // min sizes for Material buttons
                      alignment: Alignment.center,
                      child: const Text(
                        'ENTRAR',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.amber,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          
                        ),
                      ),
                    ),
                  ),
                ),
                /* ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.indigo,
                    onPrimary: Colors.amber.shade300,
                    onSurface: Colors.grey,
                  ),
                  // alignment: Alignment.center,
                  // icon: const Icon(Icons.login),
                  // color: Colors.amber.shade300,
                  // iconSize: 35,
                  // tooltip: 'Logar',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // ut.Message(context, "Voce Logou em  amauri financeiro ",
                      // "Parabéns");
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    } else {
                      ut.Message(context, "Te amo mais que tudo ",
                          "Mensagem para Thine");
                    }
                  },
                  child: Text('Entrar'),
                )*/
              ],
            )

            /* Gradienttextfield(
              controller: email,
              radius: 40,
              height: 60,
              width: 400,
              colors: const [
                Color.fromARGB(255, 128, 183, 234),
                Color.fromARGB(255, 233, 233, 233),
              ],
              text: "",
              fontColor: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.normal,
            ),
           
             Gradienttextfield(
              controller: Senha,
              radius: 40,
              height: 60,
              width: 400,
              colors: const [
                Color.fromARGB(255, 128, 183, 234),
                Color.fromARGB(255, 233, 233, 233),
              ],
              text: "",
              fontColor: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.normal,
            ),*/
          ],
        ),
      ),
    ));
  }
}
