import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projeto_reg_snake/shared/data/models/m_menu.dart';
import '../alimenta_serpente.dart';
import '../cadastro_serpente.dart';
import '../cadastro_usuario.dart';
import '../consulta_serpente.dart';
import '../obito_serpente.dart';
import '../sobre_page.dart';
import '../vermifugacao_serpente.dart';

class WMenu extends StatelessWidget {
  final Menu menu;

  WMenu({this.menu});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          if (menu.name == 'Sobre') {
            Navigator.push(
              context,
              PageRouteBuilder(
                  transitionDuration: Duration(milliseconds: 100),
                  pageBuilder: (_, __, ___) => SobrePage(
                        title: menu.name,
                      )),
            );
          } else if (menu.name == 'Cadastro de usuário') {
            Navigator.push(
              context,
              PageRouteBuilder(
                  transitionDuration: Duration(milliseconds: 100),
                  pageBuilder: (_, __, ___) => CadastroUsuario(
                        title: menu.name,
                      )),
            );
          } else if (menu.name == 'Registro de serpente') {
            Navigator.push(
              context,
              PageRouteBuilder(
                  transitionDuration: Duration(milliseconds: 100),
                  pageBuilder: (_, __, ___) => CadastroSerpente()),
            );
          } else if (menu.name == 'Consulta') {
            Navigator.push(
              context,
              PageRouteBuilder(
                  transitionDuration: Duration(milliseconds: 100),
                  pageBuilder: (_, __, ___) => ConsultaSerpente()),
            );
          } else if (menu.name == 'Alimentação') {
            Navigator.push(
              context,
              PageRouteBuilder(
                  transitionDuration: Duration(milliseconds: 100),
                  pageBuilder: (_, __, ___) => AlimentaSerpente()),
            );
          } else if (menu.name == 'Vermifugação') {
            Navigator.push(
              context,
              PageRouteBuilder(
                  transitionDuration: Duration(milliseconds: 100),
                  pageBuilder: (_, __, ___) => VermifugacaoSerpente()),
            );
          } else if (menu.name == 'Óbito') {
            Navigator.push(
              context,
              PageRouteBuilder(
                  transitionDuration: Duration(milliseconds: 100),
                  pageBuilder: (_, __, ___) => ObitoSerpente()),
            );
          }
        },
        child: Hero(
            tag: menu.name,
            child: Container(
              width: MediaQuery.of(context).size.width / 2.3,
              height: MediaQuery.of(context).size.height / 4,
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(2, 4), // Shadow position
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SvgPicture.asset(
                    menu.icon,
                    semanticsLabel: menu.name,
                    color: Colors.blue,
                    height: 40,
                  ),
                  Container(
                      child: Text(menu.name,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize:
                                  MediaQuery.of(context).size.height / 60)))
                ],
              ),
            )));
  }
}
