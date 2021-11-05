import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:projeto_reg_snake/control/alimenta_controller.dart';
import 'package:projeto_reg_snake/shared/data/service/snake_service_api_post.dart';
import 'package:projeto_reg_snake/view/screens/menu_page.dart';
import 'package:projeto_reg_snake/view/screens/widgets/w_botao.dart';
import 'package:projeto_reg_snake/view/screens/widgets/w_campo_bcode.dart';
import 'package:projeto_reg_snake/view/screens/widgets/w_campo_data.dart';
import 'package:projeto_reg_snake/view/screens/widgets/w_campo_texto.dart';

class AlimentaSerpente extends StatefulWidget {
  AlimentaSerpente({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _AlimentaSerpente createState() => _AlimentaSerpente();
}

class _AlimentaSerpente extends State<AlimentaSerpente> {
  AlimentaController alimentaSerpente = AlimentaController(
    txtData: TextEditingController(),
    txtEspecie: TextEditingController(),
    txtMicrochip: TextEditingController(),
    txtQuantidade: TextEditingController(),
    formKey: GlobalKey<FormState>(),
    snakeServiceApiPost: SnakeServiceApiPost(),
  );
  DateTime data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Registro de alimentação',
              style: Theme.of(context).textTheme.headline1),
          backgroundColor: Theme.of(context).primaryColor,
          centerTitle: true,
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        body: SingleChildScrollView(
            child: Container(
          padding: EdgeInsets.all(40),
          child: Form(
            key: alimentaSerpente.formKey,
            child: Column(children: [
              SvgPicture.asset('imagens/scared.svg', semanticsLabel: 'scared'),
              WCampoBCode(
                rotulo: 'Número do Chip',
                variavel: alimentaSerpente.txtMicrochip,
                eSenha: false,
                icon: IconButton(
                  onPressed: () {
                    // scanBarcodeNormal();
                  },
                  color: Colors.blue[100],
                  icon: Icon(Icons.camera_alt),
                ),
              ),
              WCampoData(
                rotulo: 'Data da alimentação',
                variavel: alimentaSerpente.txtData,
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
                    alimentaSerpente.txtData.text = datain.format(data);
                  },
                ),
              ),
              WCampoTexto(
                  rotulo: 'Quantidade',
                  variavel: alimentaSerpente.txtQuantidade,
                  eSenha: false,
                  validator: (value) {
                    if (value.length < 1) {
                      return 'Insira uma quantidade';
                    } else if (int.parse(value) > 9) {
                      return 'A quantidade não pode ser maior que 9';
                    } else {
                      return null;
                    }
                  }),
              WCampoTexto(
                validator: (value) {
                  if (value.length == 0) {
                    return 'Insira uma espécie';
                  } else {
                    return null;
                  }
                },
                rotulo: 'Espécie',
                variavel: alimentaSerpente.txtEspecie,
                eSenha: false,
              ),
              GestureDetector(
                onTap: () {
                  salvarAlimentacao();
                },
                child: WBotao(rotulo: 'Salvar'),
              )
            ]),
          ),
        )));
  }

  Future<void> salvarAlimentacao() async {
    if (alimentaSerpente.formKey.currentState.validate()) {
      Map<String, dynamic> map = {
        'Microchip': alimentaSerpente.txtMicrochip.text,
        'Data': alimentaSerpente.txtData.text,
        'Quantidade': alimentaSerpente.txtQuantidade.text,
        'Especie': alimentaSerpente.txtEspecie.text,
      };
      bool result = await alimentaSerpente.snakeServiceApiPost
          .addDado(colecao: 'alimentacao', map: map);

      if (result == true) {
        Navigator.push(
          context,
          PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 100),
              pageBuilder: (_, __, ___) => MenuPage()),
        );
      }
    }
  }

//  Future<void> scanBarcodeNormal() async {
//    String barcodeScanRes;
//    // Platform messages may fail, so we use a try/catch PlatformException.
//    try {
//      alimentaSerpente.txtMicrochip.text = await FlutterBarcodeScanner.scanBarcode(
//          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
//      print(barcodeScanRes);
//    } on PlatformException {
//      barcodeScanRes = 'Failed to get platform version.';
//    }
//  }
}
