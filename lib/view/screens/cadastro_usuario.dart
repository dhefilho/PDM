import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projeto_reg_snake/control/cadastro_controller.dart';
import 'package:projeto_reg_snake/view/screens/widgets/w_botao.dart';
import 'package:projeto_reg_snake/view/screens/widgets/w_campo_texto.dart';

class CadastroUsuario extends StatefulWidget {
  CadastroUsuario({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _CadastroUsuario createState() => _CadastroUsuario();
}

class _CadastroUsuario extends State<CadastroUsuario> {
  CadastroController cadastroController = CadastroController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cadastrar usuário', style: Theme.of(context).textTheme.headline1),
          backgroundColor: Theme.of(context).primaryColor,
          centerTitle: true,
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(40),
          child: Form(
            
            key: cadastroController.formKey,
            child: Column(children: [
              SvgPicture.asset('imagens/scared.svg', semanticsLabel: 'scared'),
              WCampoTexto(rotulo: 'Nome', variavel: cadastroController.txtNome,eSenha: false),
              WCampoTexto(rotulo: 'Email', variavel: cadastroController.txtEmail, eSenha: false),
              WCampoTexto(rotulo: 'CPF', variavel: cadastroController.txtCPF, eSenha: false,),
              WCampoTexto(rotulo: 'Senha', variavel: cadastroController.txtCPF, eSenha: true),
              WBotao(rotulo: 'Cadastrar'),
            ]),
          ),
        )));
  }
}
