import 'dart:async';

import 'package:amaurifinanceiro/pages/cadastro/nome_cad.dart';
import 'package:amaurifinanceiro/pages/cadastro/senha_cad.dart';
import 'package:amaurifinanceiro/pages/staticpage.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? timer;
  @override
  void initState() { 
    super.initState();
    timer = Timer(
        Duration(seconds: 5),
        () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Static(),
            )));
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.cyan, Colors.indigo]
                  // colors: [Colors.blueAccent, Colors.purple],
                  )),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                          backgroundColor: Colors.amber.shade300,
                          maxRadius: 50,
                          minRadius: 15,
                          child: Icon(
                            Icons.monetization_on_rounded,
                            color: Colors.cyan,
                            size: 45,
                          )),
                      Padding(padding: EdgeInsets.only(top: 40.0)),
                      Text(
                        "Olá, Bem vindo!",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 21,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                )),
            Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Padding(padding: EdgeInsets.only(top: 25)),
                    Text(
                      "Aguarde um minuto ",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ))
          ],
        )
      ],
    ));
  }
}
