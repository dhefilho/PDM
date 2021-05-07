
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SobrePage extends StatefulWidget {
  SobrePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SobrePage createState() => _SobrePage();
}

class _SobrePage extends State<SobrePage> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sobre',
              style: Theme.of(context).textTheme.headline1),
          backgroundColor: Theme.of(context).primaryColor,
          centerTitle: true,
        ),
          backgroundColor: Theme.of(context).backgroundColor,
            body: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                
               
                padding: EdgeInsets.all(40),
                child: Column(children: [
              
                Text("Registro e Controle de Serpentes \n\n Esse é um aplicativo para registro geral de controle de serpentes               feita para ofidários. O aplicativo é capaz de registrar serpentes,               cadastrar usuários, registrar alimentações e vermifugações e registrar óbitos.\n\n\n"),
                Image.asset('imagens/daoud.jpg'),
                Text("Daoud Elias", 
                style: TextStyle(color:Colors.blue, fontWeight: FontWeight.bold
                )
              ),
              Container(height: 10,),
              Image.asset('imagens/washington.png'),
              Text("Washington Miranda", 
                style: TextStyle(color:Colors.blue, fontWeight: FontWeight.bold
                )
              ),
              Container(height: 10,),
            ],
            ),
          ),
        )
    );
  }

  
}
