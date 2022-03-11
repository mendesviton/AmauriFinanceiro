import 'package:amaurifinanceiro/controler/validador.dart';
import 'package:amaurifinanceiro/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class cadastro extends StatefulWidget {
  @override
  _amaurifinanceiro createState() => _amaurifinanceiro();
}

class _amaurifinanceiro extends State<cadastro> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController Ctrl = TextEditingController();
  Util ut = Util();
  bool showpassword = false;
  bool enabled = false;
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
                    colors: [Colors.cyan, Colors.indigo]
                    // colors: [Colors.blueAccent, Colors.purple],
                    )),
            // color: Color.fromARGB(255, 128, 183, 234),
            child: Form(
                key: _formKey,
                child: ListView(children: <Widget>[
                  // SizedBox(
                  // width: 100,
                  // height: 200,
                  // child: Image.asset("assets/amauri.png"),
                  // ),
                  SizedBox(
                    height: 85,
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
                          labelText: "Nome Completo",
                          labelStyle: TextStyle(
                            color: Colors.amber.shade300,
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                          )),
                      style:
                          TextStyle(fontSize: 20, color: Colors.amber.shade300),
                      cursorColor: Colors.amber.shade300,
                      //autofocus: true,
                      textAlignVertical: TextAlignVertical.center,
                      textAlign: TextAlign.center),

                  TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Digite um Login válido';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          labelText: "E-mail",
                          labelStyle: TextStyle(
                            color: Colors.amber.shade300,
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                          )),
                      style:
                          TextStyle(fontSize: 20, color: Colors.amber.shade300),
                      cursorColor: Colors.amber.shade300,
                      //autofocus: true,

                      textAlignVertical: TextAlignVertical.center,
                      textAlign: TextAlign.center),
                  /*   Row(
                    children: <Widget>[
                      Expanded(
                          child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Digite um Login válido';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  labelText: "",
                                  labelStyle: TextStyle(
                                    color: Colors.amber.shade300,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20,
                                  )),
                              style: TextStyle(
                                  fontSize: 20, color: Colors.amber.shade300),
                              cursorColor: Colors.amber.shade300,
                              //autofocus: true,
                              textAlignVertical: TextAlignVertical.center,
                              textAlign: TextAlign.center)),
                      Switch(
                          value: enabled,
                          onChanged: (bool val) {
                            setState(() {
                              enabled = val;
                            });
                          })
                    ],
                  )*/
                  Row(children: <Widget>[
                    Expanded(
                      child: TextFormField(
                          //controller: Ctrl,
                          obscureText: !(showpassword),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Digite um Login válido';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              suffixIcon: GestureDetector(
                                  child: Icon(Icons.visibility)),
                              icon: Icon(IconData(0xe043,
                                  fontFamily: 'MaterialIcons')),
                              labelText: "Senha",
                              labelStyle: TextStyle(
                                color: Colors.amber.shade300,
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                              )),
                          style: TextStyle(
                              fontSize: 20, color: Colors.amber.shade300),
                          cursorColor: Colors.amber.shade300,
                          //autofocus: true,
                          textAlignVertical: TextAlignVertical.center,
                          textAlign: TextAlign.center),
                    ),
                    IconButton(
                      onPressed: () {
                        showpassword = true;
                      },
                      icon: const Icon(Icons.remove_red_eye),
                      color: Colors.amber.shade300,
                    ),
                    ElevatedButton(
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
                        showpassword = false;
                      },

                      child: Text('Entrar'),
                    )
                  ]),
                ]))));
  }
}
