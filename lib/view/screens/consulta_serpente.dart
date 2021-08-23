import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projeto_reg_snake/control/consulta_controller.dart';
import 'package:projeto_reg_snake/data/service/snake_service_api_get.dart';
import 'package:projeto_reg_snake/view/screens/widgets/w_botao.dart';
import 'package:projeto_reg_snake/view/screens/widgets/w_campo_bcode.dart';
import 'package:projeto_reg_snake/view/screens/widgets/w_campo_data.dart';


class ConsultaSerpente extends StatefulWidget {
  ConsultaSerpente({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ConsultaSerpente createState() => _ConsultaSerpente();
}

class _ConsultaSerpente extends State<ConsultaSerpente> {
  ConsultaController consultaController = ConsultaController(snakeServiceApiGet: new SnakeServiceApiGet());

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Consulta de serpentes registradas',
              style: Theme.of(context).textTheme.headline1),
          backgroundColor: Theme.of(context).primaryColor,
          centerTitle: true,
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        body: SingleChildScrollView(
            child: Container(
          padding: EdgeInsets.all(40),
          child: Form(
            key: consultaController.formKey,
            child: Column(children: [
              SvgPicture.asset('imagens/scared.svg', semanticsLabel: 'scared'),
              WCampoBCode(
                rotulo: 'Número do Chip',
                variavel: consultaController.txtMicrochip,
                eSenha: false,
                icon: IconButton(
                  onPressed: () {
                    //_scanQR();
                    //scanBarcodeNormal();
                  },
                  color: Colors.blue[100],
                  icon: Icon(Icons.camera_alt),
                ),
              ),
              Text(consultaController.content),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 6),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(9)),
                    border: Border.all(color: Colors.grey)),
                child: DropdownButton<String>(
                    items: consultaController.especies.map((String dropDownStringItem) {
                      return DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: Text(dropDownStringItem),

                      );
                    }).toList(),
                    onChanged: (String novoItemSelecionado) {
                      _dropDownItemSelected(novoItemSelecionado);
                      setState(() {
                        this.consultaController.itemSelecionado = novoItemSelecionado;
                      });
                    },
                    value: consultaController.itemSelecionado),
              ),
              WCampoData(
                rotulo: 'Data inicial',
                variavel: consultaController.txtDataRegI,
                eSenha: false,
                icon: IconButton(
                  icon: Icon(Icons.today_rounded),
                  onPressed: () async {
                    DateFormat datain = DateFormat("dd/MM/yyyy");
                    consultaController.data = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2018),
                      lastDate: DateTime(2030),
                      builder: (context, child) {
                        return Theme(data: ThemeData.dark(), child: child);
                      },
                    );
                    consultaController.txtDataRegI.text = datain.format(consultaController.data);
                  },
                ),
              ),
              WCampoData(
                rotulo: 'Data final',
                variavel: consultaController.txtDataRegF,
                eSenha: false,
                icon: IconButton(
                  icon: Icon(Icons.today_rounded),
                  onPressed: () async {
                    DateFormat datain = DateFormat("dd/MM/yyyy");
                    consultaController.data = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2018),
                      lastDate: DateTime(2030),
                      builder: (context, child) {
                        return Theme(data: ThemeData.dark(), child: child);
                      },
                    );
                    consultaController.txtDataRegF.text = datain.format(consultaController.data);
                  },
                ),
              ),
              GestureDetector(
                onTap: (){
                  consultaController.getSnake();
                },
                child: WBotao(rotulo: 'Consultar'),
              )
              
            ]),
          ),
        )));
  }

  void _dropDownItemSelected(String novoItem) {
    setState(() {
      this.consultaController.itemSelecionado = novoItem;
    });
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
