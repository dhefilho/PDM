import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:projeto_reg_snake/control/vermifugacao_controller.dart';
import 'package:projeto_reg_snake/view/screens/widgets/w_botao.dart';
import 'package:projeto_reg_snake/view/screens/widgets/w_campo_data.dart';
import 'package:projeto_reg_snake/view/screens/widgets/w_campo_texto.dart';

class VermifugacaoSerpente extends StatefulWidget {
  VermifugacaoSerpente({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _VermifugacaoSerpente createState() => _VermifugacaoSerpente();
}

class _VermifugacaoSerpente extends State<VermifugacaoSerpente> {
  VermifugacaoController vermifugacaoController = VermifugacaoController();
  DateTime data;

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
          child: Form(
            key: vermifugacaoController.formKey,
            child: Column(children: [
              SvgPicture.asset('imagens/scared.svg', semanticsLabel: 'scared'),
              WCampoTexto(
                  rotulo: 'Microchip',
                  variavel: vermifugacaoController.txtMicrochip,
                  eSenha: false),
              WCampoData(
                rotulo: 'Data da vermifugação',
                variavel: vermifugacaoController.txtData,
                eSenha: false,
                icon: IconButton(
                  icon: Icon(Icons.today_rounded),
                  onPressed: () async {
                    DateFormat datain = DateFormat("dd/MM/yyyy");
                    data = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2018),
                      lastDate: DateTime(2030),
                      builder: (context, child) {
                        return Theme(data: ThemeData.dark(), child: child);
                      },
                    );
                    vermifugacaoController.txtData.text = datain.format(data);
                  },
                ),
              ),
              WCampoTexto(
                rotulo: 'Medicamento usado',
                variavel: vermifugacaoController.txtMedicaVerm,
                eSenha: false,
              ),
              WBotao(rotulo: 'Registrar'),
            ]),
          ),
        )));
  }
}
