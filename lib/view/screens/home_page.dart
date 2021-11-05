import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projeto_reg_snake/shared/data/service/snake_auth_service.dart';
import 'package:projeto_reg_snake/view/screens/widgets/w_botao.dart';
import 'package:projeto_reg_snake/view/screens/widgets/w_campo_texto.dart';
import 'package:toast/toast.dart';
import 'cadastro_usuario.dart';
import 'menu_page.dart';

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
  SnakeAuthService snakeAuthService = new SnakeAuthService();

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
              WCampoTexto(rotulo:'Login', variavel: txtLogin,eSenha: false,
                validator: (value) {
                  String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                  RegExp regExp = new RegExp(pattern);
                  if (value.length == 0) {
                    return "Informe o Email";
                  } else if(!regExp.hasMatch(value)){
                    return "Email inválido";
                  }else {
                    return null;
                  }}),
              WCampoTexto(rotulo:'Senha', variavel:txtSenha,eSenha:true,
                validator: (value) {
                  if (value.length < 6) {
                    return 'A senha precisa ter 6 caracteres';
                  } else {
                  return null;
                  }},),
               GestureDetector(
                onTap: (){
                  login();
                },
                child:WBotao(rotulo:'Entrar'  )
              ),
              Container(height:10),
              GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context, PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 100),
                        pageBuilder: (_, __, ___) => CadastroUsuario()),
                    );
                  },
                  child:WBotao(rotulo:'Cadastro'  )
              )

            ]),
          ),
        ));
  }

  Future<void> login() async {
    if (formKey.currentState.validate()) {
      String result = await snakeAuthService.login(txtLogin.text, txtSenha.text);
      if(result == 'login com sucesso'){
        Navigator.push(
          context, PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 100),
            pageBuilder: (_, __, ___) => MenuPage()),
        );
      }else{
        Toast.show(result, context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
      }
    }


  }



}
