import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projeto_reg_snake/view/screens/cadastro_serpente.dart';
import 'package:projeto_reg_snake/view/screens/cadastro_usuario.dart';
import 'package:projeto_reg_snake/view/screens/consulta_serpente.dart';
import 'package:projeto_reg_snake/view/screens/obito_serpente.dart';
import 'package:projeto_reg_snake/view/screens/sobre_page.dart';
import 'package:projeto_reg_snake/view/screens/vermifugacao_serpente.dart';
import 'package:projeto_reg_snake/view/screens/widgets/w_botao.dart';

import 'alimenta_serpente.dart';

class MenuPage extends StatefulWidget {
  MenuPage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('RegSnake', style: Theme.of(context).textTheme.headline1),
          backgroundColor: Theme.of(context).primaryColor,
          centerTitle: true,
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        body: SingleChildScrollView(
          child: Container(
          padding: EdgeInsets.all(40),
          child: Column(children: [
            SvgPicture.asset('imagens/scared.svg', semanticsLabel: 'scared'),
            //WBotao(rotulo: 'Menu'),
            WBotao(rotulo: 'Sobre'),
             GestureDetector(
                onTap: (){
                  Navigator.push(
                    context, PageRouteBuilder(
                      transitionDuration: Duration(milliseconds: 100),
                      pageBuilder: (_, __, ___) => SobrePage()),
                  );
                },
                child:WBotao(rotulo:'Sobre'  )
              ),

              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context, PageRouteBuilder(
                      transitionDuration: Duration(milliseconds: 100),
                      pageBuilder: (_, __, ___) => CadastroUsuario()),
                  );
                },
                child:WBotao(rotulo:'Cadastro de usuário'  )
              ),

            GestureDetector(
                onTap: (){
                  Navigator.push(
                    context, PageRouteBuilder(
                      transitionDuration: Duration(milliseconds: 100),
                      pageBuilder: (_, __, ___) => CadastroSerpente()),
                  );
                },
                child:WBotao(rotulo:'Registro de serpente'  )
              ),
            //WBotao(rotulo: 'Consulta'),
            GestureDetector(
                onTap: (){
                  Navigator.push(
                    context, PageRouteBuilder(
                      transitionDuration: Duration(milliseconds: 100),
                      pageBuilder: (_, __, ___) => ConsultaSerpente()),
                  );},
                  child:WBotao(rotulo:'Consulta')),
            //WBotao(rotulo: 'Alimentação'),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context, PageRouteBuilder(
                      transitionDuration: Duration(milliseconds: 100),
                      pageBuilder: (_, __, ___) => AlimentaSerpente()),
                  );
                },
                child:WBotao(rotulo:'Alimentação'  )
              ),
            //WBotao(rotulo: 'Vermifugação'),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context, PageRouteBuilder(
                      transitionDuration: Duration(milliseconds: 100),
                      pageBuilder: (_, __, ___) => VermifugacaoSerpente()),
                  );
                },
                child:WBotao(rotulo:'Vermifugação'  )
              ),
            //WBotao(rotulo: 'Óbitos'),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context, PageRouteBuilder(
                      transitionDuration: Duration(milliseconds: 100),
                      pageBuilder: (_, __, ___) => ObitoSerpente()),
                  );},
                  child:WBotao(rotulo:'Óbito'  )
          )]),
        )));
  }
}
