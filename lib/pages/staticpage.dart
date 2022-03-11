import 'package:amaurifinanceiro/pages/cadastro/cadastro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Static extends StatefulWidget {
  @override
  _Staticpage createState() => _Staticpage();
}

class _Staticpage extends State<Static> {
  final _formKey = GlobalKey<FormState>();
  @override
  void initstate() {
    super.initState();
    //similar ao metodo oncreate do delphi
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.only(top: 50),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.cyan, Colors.indigo]
              // colors: [Colors.blueAccent, Colors.purple],
              )),
      child: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 15, right: 45),
            child: SizedBox(
              width: 75,
              height: 50,
              child: Image.asset(
                "assets/imageprincipal.png",
                alignment: Alignment.centerRight,
              ),
            ),
            height: 175,
            // color: Colors.amber,
          ),
        ],
      ),
    ));
  }
}
