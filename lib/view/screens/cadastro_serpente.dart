import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projeto_reg_snake/control/serpente_controller.dart';
import 'package:projeto_reg_snake/shared/data/service/snake_service_api_post.dart';
import 'package:projeto_reg_snake/view/screens/widgets/w_botao.dart';
import 'package:projeto_reg_snake/view/screens/widgets/w_campo_bcode.dart';
import 'package:projeto_reg_snake/view/screens/widgets/w_campo_texto.dart';

class CadastroSerpente extends StatefulWidget {
  CadastroSerpente({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _CadastroSerpente createState() => _CadastroSerpente();
}

class _CadastroSerpente extends State<CadastroSerpente> {
  SerpenteController serpenteController =
  SerpenteController(snakeServiceApiPost: new SnakeServiceApiPost());
  final picker = ImagePicker();
  Image image = null;
  String scanBarcode = "";
  String content = "";

  Future getImage() async {
    serpenteController.pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (serpenteController.pickedFile != null) {
        
        if (kIsWeb) {
        image = Image.network(serpenteController.pickedFile.path);
        } else {
          image = Image.file(File(serpenteController.pickedFile.path));
        }
        } else {
        print('Nenhuma imagem selecionada');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Registro de novas serpentes',
              style: Theme.of(context).textTheme.headline1),
          backgroundColor: Theme.of(context).primaryColor,
          centerTitle: true,
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        body: SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.all(40),
                child: Form(
                    key: serpenteController.formKey,
                    child: Column(children: [
                      SvgPicture.asset('imagens/scared.svg',
                          semanticsLabel: 'scared'),
                      image == null
                          ? IconButton(
                              onPressed: () {
                                getImage();
                              },
                              color: Colors.blue,
                              iconSize:
                                  MediaQuery //para ajustar ao tamanho da tela
                                              .of(context)
                                          .size
                                          .height /
                                      15,
                              icon: Icon(Icons.add_a_photo_rounded),
                            )
                          : Image(
                              image: image.image,
                            ),
                      WCampoTexto(
                        validator: (value) {
                          if (value.length == 0) {
                          return 'Informe uma espécie';
                          } else {
                            return null;
                          }
                          },
                          rotulo: 'Espécie',
                          variavel: serpenteController.txtEspecie,
                          eSenha: false),
                      WCampoTexto(
                        validator: (value) {
                          if (value.length == 0) {
                          return 'Informe o sexo';
                          } else {
                            return null;
                          }
                          },
                          rotulo: 'Sexo',
                          variavel: serpenteController.txtSexo,
                          eSenha: false),
                      WCampoTexto(
                        validator: (value) {
                          if (value.length < 2) {
                          return 'Insira um peso válido';
                          } else {
                            return null;
                          }
                        },
                        rotulo: 'Peso',
                        variavel: serpenteController.txtPeso,
                        eSenha: false,
                      ),
                      WCampoBCode(
                        rotulo: 'Número do Chip',
                        variavel: serpenteController.txtNChip,
                        eSenha: false,
                        icon: IconButton(
                          onPressed: () {
                            //_scanQR();
                            // scanBarcodeNormal();
                          },
                          color: Colors.blue[100],
                          icon: Icon(Icons.camera_alt),
                        ),
                      ),
                      Text(content),
                      WCampoTexto(
                          validator: (value) {
                          if (value.length == 0) {
                            return 'Informe a procedência do animal';
                            } else {
                            return null;
                            }
                          },
                          rotulo: 'Procedência',
                          variavel: serpenteController.txtProcedencia,
                          eSenha: false),
                      WCampoTexto(
                        validator: (value) {
                          if (value.length == 0) {
                            return 'Informe o nome da cidade';
                            } else {
                            return null;
                            }
                          },
                          rotulo: 'Cidade',
                          variavel: serpenteController.txtCidade,
                          eSenha: false),
                      WCampoTexto(
                          validator: (value) {
                          if (value.length == 0) {
                            return 'Informe o estado';
                            } else {
                            return null;
                            }
                          },
                          rotulo: 'Estado',
                          variavel: serpenteController.txtEstado,
                          eSenha: false),
                      WCampoTexto(
                          validator: (value) {
                          if (value.length == 0) {
                            return 'Informe o nome do doador';
                            } else {
                            return null;
                            }
                          },
                          rotulo: 'Nome do doador',
                          variavel: serpenteController.txtDoadorNome,
                          eSenha: false),
                      WCampoTexto(
                          validator: (value) {
                          if (value.length < 12) {
                            return 'Informe o CPF do doador';
                            } else {
                            return null;
                            }
                          },
                          rotulo: 'CPF do doador',
                          variavel: serpenteController.txtDoadorCPF,
                          eSenha: false),
                      GestureDetector(
                        onTap: () {
                          serpenteController.saveSnake(context);
                        },
                        child: WBotao(rotulo: 'Registrar'),
                      )
                    ])))));
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
//
//    // If the widget was removed from the tree while the asynchronous platform
//    // message was in flight, we want to discard the reply rather than calling
//    // setState to update our non-existent appearance.
//    if (!mounted) return;
//
//    setState(() {
//      scanBarcode = barcodeScanRes;
//    });
//  }
//
//  void _scanQR() async {
//    String result;
//    try {
//      result = await QrUtils.scanQR;
//    } on PlatformException {
//      result = 'Process Failed!';
//    }
//
//    setState(() {
//      content = result;
//    });
//  }
}
