import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:projeto_reg_snake/control/obito_controller.dart';
import 'package:projeto_reg_snake/shared/data/service/snake_service_api_post.dart';
import 'package:projeto_reg_snake/view/screens/menu_page.dart';
import 'package:projeto_reg_snake/view/screens/widgets/w_botao.dart';
import 'package:projeto_reg_snake/view/screens/widgets/w_campo_bcode.dart';
import 'package:projeto_reg_snake/view/screens/widgets/w_campo_data.dart';
import 'package:projeto_reg_snake/view/screens/widgets/w_campo_texto.dart';

class ObitoSerpente extends StatefulWidget {
  ObitoSerpente({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ObitoSerpente createState() => _ObitoSerpente();
}

class _ObitoSerpente extends State<ObitoSerpente> {
  ObitoController obitoController = ObitoController(
      txtData: TextEditingController(),
      txtCausa: TextEditingController(),
      txtMicrochip: TextEditingController(),
      formKey: GlobalKey<FormState>(),
      snakeServiceApiPost: new SnakeServiceApiPost());
  DateTime data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Registro de óbitos',
              style: Theme.of(context).textTheme.headline1),
          backgroundColor: Theme.of(context).primaryColor,
          centerTitle: true,
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        body: SingleChildScrollView(
            child: Container(
          padding: EdgeInsets.all(40),
          child: Form(
            key: obitoController.formKey,
            child: Column(children: [
              SvgPicture.asset('imagens/scared.svg', semanticsLabel: 'scared'),
              WCampoBCode(
                rotulo: 'Número do Chip',
                variavel: obitoController.txtMicrochip,
                eSenha: false,
                icon: IconButton(
                  onPressed: () {
                    //scanBarcodeNormal();
                  },
                  color: Colors.blue[100],
                  icon: Icon(Icons.camera_alt),
                ),
              ),
              WCampoData(
                rotulo: 'Data',
                variavel: obitoController.txtData,
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
                    obitoController.txtData.text = datain.format(data);
                  },
                ),
              ),
              WCampoTexto(
                validator: (value) {
                  if (value.length < 6) {
                  return 'Informe a causa mortis';
                  } else {
                  return null;
                  }
                },
                  rotulo: 'Causa mortis',
                  variavel: obitoController.txtCausa,
                  eSenha: false),
              GestureDetector(
                  onTap: () {
                    registroObito();
                  },
                  child: WBotao(rotulo: 'Registrar óbito')),
            ]),
          ),
        )));
  }

  Future<void> registroObito() async {
    if (obitoController.formKey.currentState.validate()) {
      Map<String, dynamic> map = {
        'Numerodochip': obitoController.txtMicrochip.text,
        'Data': obitoController.txtData.text,
        'CausaMortis': obitoController.txtCausa.text
      };
      bool result = await obitoController.snakeServiceApiPost
            .addDado(colecao: 'obito', map: map);

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
//      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
//          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
//      print(barcodeScanRes);
//    } on PlatformException {
//      barcodeScanRes = 'Failed to get platform version.';
//    }
//  }
}
