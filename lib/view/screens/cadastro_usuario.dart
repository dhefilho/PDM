import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projeto_reg_snake/control/cadastro_controller.dart';
import 'package:projeto_reg_snake/data/service/snake_auth_service.dart';
import 'package:projeto_reg_snake/data/service/snake_service_api_post.dart';
import 'package:projeto_reg_snake/view/screens/widgets/w_botao.dart';
import 'package:projeto_reg_snake/view/screens/widgets/w_campo_texto.dart';
import 'package:toast/toast.dart';
import 'menu_page.dart';
import 'package:projeto_reg_snake/data/models/user.dart' as User;

class CadastroUsuario extends StatefulWidget {
  CadastroUsuario({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _CadastroUsuario createState() => _CadastroUsuario();
}

class _CadastroUsuario extends State<CadastroUsuario> {
  CadastroController cadastroController = CadastroController(
      txtCPF: MaskedTextController(mask: '000.000.000-00'),
      txtSenha: TextEditingController(),
      txtEmail: TextEditingController(),
      txtNome: TextEditingController(),
      formKey: GlobalKey<FormState>(),
      snakeAuthService: new SnakeAuthService(),
      snakeServiceApiPost: new SnakeServiceApiPost());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cadastrar usuário',
              style: Theme.of(context).textTheme.headline1),
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
                    SvgPicture.asset('imagens/scared.svg',
                        semanticsLabel: 'scared'),
                    WCampoTexto(
                       validator: (value) {
                          if (value.length < 12) {
                            return 'Informe o nome completo do doador';
                            } else {
                            return null;
                            }
                          },
                        rotulo: 'Nome',
                        variavel: cadastroController.txtNome,
                        eSenha: false),
                    WCampoTexto(
                        validator: (value) {
                        String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                        RegExp regExp = new RegExp(pattern);
                        if (value.length == 0) {
                          return "Informe o Email";
                        } else if(!regExp.hasMatch(value)){
                          return "Email inválido";
                        }else {
                          return null;
                        }},
                        rotulo: 'Email',
                        variavel: cadastroController.txtEmail,
                        eSenha: false),
                    WCampoTexto(
                       validator: (value) {
                          if (value.length < 12) {
                            return 'Informe o CPF do doador';
                            } else {
                            return null;
                            }
                          },
                      rotulo: 'CPF',
                      variavel: cadastroController.txtCPF,
                      eSenha: false,
                    ),
                    WCampoTexto(
                        validator: (value) {
                          if (value.length < 6) {
                            return 'Informe senha com mínimo de 6 caracteres';
                            } else {
                            return null;
                            }
                          },
                        rotulo: 'Senha',
                        variavel: cadastroController.txtSenha,
                        eSenha: true),
                    GestureDetector(
                      onTap: () {
                        cadastro();
                      },
                      child: WBotao(rotulo: 'Cadastrar'),
                    )
                  ]),
                ))));
  }

  Future<void> cadastro() async {
    if (cadastroController.formKey.currentState.validate()) {
      /// Aqui ele cadastro o usuario no firebase auth
      String result = await cadastroController.snakeAuthService.cadastro(
          cadastroController.txtEmail.text, cadastroController.txtEmail.text);

      if (result == 'usuário cadastrado com sucesso') {
        /// Aqui ele salva os dados do suario no firestore
        User.User user = new User.User();
        user.nome = cadastroController.txtNome.text;
        user.senha = cadastroController.txtSenha.text;
        user.email = cadastroController.txtEmail.text;
        user.cpf = cadastroController.txtCPF.text;

        Map<String, dynamic> map = {
          'nome': user.nome,
          'email': user.email,
          'capd': user.cpf,
        };

        bool result = await cadastroController.snakeServiceApiPost
            .addDado(colecao: 'users', map: map);

        if (result == true) {
          Navigator.push(
            context,
            PageRouteBuilder(
                transitionDuration: Duration(milliseconds: 100),
                pageBuilder: (_, __, ___) => MenuPage()),
          );
        }
      } else {
        Toast.show(result, context,
            duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
      }

      print(result);
    }
  }
}
