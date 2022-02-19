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
      padding: EdgeInsets.only(
        top: 1,
        left: 40,
        right: 40,
      ),
      color: Color.fromARGB(255, 128, 183, 234),
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
                    labelText: "Login",
                    labelStyle: TextStyle(
                      color: Colors.amber.shade300,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    )),
                style: TextStyle(fontSize: 20, color: Colors.amber.shade300),
                cursorColor: Colors.amber.shade300,
                //autofocus: true,
                textAlignVertical: TextAlignVertical.center,
                textAlign: TextAlign.center),
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
                  labelText: "Senha",
                  labelStyle: TextStyle(
                    color: Colors.amber.shade300,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  )),
              style: TextStyle(
                fontSize: 20,
                color: Colors.amber.shade300,
              ),
              textAlignVertical: TextAlignVertical.center,
              textAlign: TextAlign.center,
              obscureText: true,
            ),
            Container(
              height: 30,
              alignment: Alignment.centerRight,
              child: TextButton(
                style: TextButton.styleFrom(
                    textStyle: TextStyle(
                        color: Colors.amber.shade300,
                        fontWeight: FontWeight.w400,
                        fontSize: 10.8)),
                onPressed: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>)))
                },
                child: Text("Recuperar Senha", textAlign: TextAlign.right),
              ),
            ),
            Container(
              height: 30,
              alignment: Alignment.centerRight,
              child: TextButton(
                style: TextButton.styleFrom(
                    textStyle: TextStyle(
                        color: Colors.amber.shade300,
                        fontWeight: FontWeight.w400,
                        fontSize: 10.8)),
                onPressed: () {
                  // navegação entre telas.

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => cadastro()),
                  );
                },
                child: Text("Cadastrar", textAlign: TextAlign.right),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    alignment: Alignment.center,
                    icon: const Icon(Icons.login),
                    color: Colors.amber.shade300,
                    iconSize: 35,
                    tooltip: 'Logar',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // ut.Message(context, "Voce Logou em  amauri financeiro ",
                        // "Parabéns");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      } else {
                        ut.Message(context, "Digita certo caralho ", "Porra");
                      }
                    })
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
