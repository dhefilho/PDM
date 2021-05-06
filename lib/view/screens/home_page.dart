import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projeto_reg_snake/view/screens/menu_page.dart';
import 'package:projeto_reg_snake/view/screens/widgets/w_botao.dart';
import 'package:projeto_reg_snake/view/screens/widgets/w_campo_texto.dart';



class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Atributos para armazenar os valores digitados pelo usuário
  var txtLogin = TextEditingController();
  var txtSenha = TextEditingController();

  //Chave que identifica unicamente o formulário
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('RegSnake', style: Theme.of(context).textTheme.headline1),
          backgroundColor: Theme.of(context).primaryColor,
          centerTitle: true,

        ),
        backgroundColor: Theme.of(context).backgroundColor,
        body: Container(
          padding: EdgeInsets.all(40),
          child: Form(
            key: formKey,
            child: Column(children: [
              SvgPicture.asset(
                  'imagens/scared.svg',
                  semanticsLabel: 'scared'
              ),
              WCampoTexto(rotulo:'Login', variavel: txtLogin,eSenha: false,),
              WCampoTexto(rotulo:'Senha', variavel:txtSenha,eSenha:true),
               GestureDetector(
                onTap: (){
                  Navigator.push(
                    context, PageRouteBuilder(
                      transitionDuration: Duration(milliseconds: 100),
                      pageBuilder: (_, __, ___) => MenuPage()),
                  );
                },
                child:WBotao(rotulo:'Entrar'  )
              )

            ]),
          ),
        ));
  }



}
