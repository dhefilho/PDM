import 'package:flutter/material.dart';


class WBotao extends StatelessWidget {
  final String rotulo;

  WBotao({this.rotulo});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      height: MediaQuery //para ajustar ao tamanho da tela
        .of(context)
        .size
        .height / 15,
      color: Colors.blue,
      child: Center(
        child: Text(rotulo, style: TextStyle(
          fontSize: 18,
          color: Colors.white)),
      ),
    );
  }
}
