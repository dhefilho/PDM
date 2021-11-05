import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projeto_reg_snake/shared/data/models/snake.dart';
import 'package:projeto_reg_snake/shared/data/service/snake_service_api_get.dart';
import 'package:projeto_reg_snake/shared/data/service/snake_service_api_post.dart';
import 'package:projeto_reg_snake/view/screens/menu_page.dart';

class SerpenteController {
  //Atributos para armazenar os valores digitados pelo usuário
  var txtEspecie = TextEditingController();
  var txtSexo = TextEditingController();
  var txtPeso = TextEditingController();
  var txtNChip = TextEditingController();
  var txtProcedencia = TextEditingController();
  var txtCidade = TextEditingController();
  var txtEstado = TextEditingController();
  var txtDoadorNome = TextEditingController();
  var txtDoadorCPF = TextEditingController();
  File image = null;
  PickedFile pickedFile;
  //Chave que identifica unicamente o formulário
  var formKey = GlobalKey<FormState>();

  SnakeServiceApiPost snakeServiceApiPost;

  SerpenteController({this.snakeServiceApiPost});

  saveSnake(BuildContext context) async {
    if (formKey.currentState.validate()) {
      Uint8List img = await pickedFile.readAsBytes();
      bool uploadImg = await snakeServiceApiPost.uploadFile(img, txtNChip.text);
      SnakeServiceApiGet snakeServiceApiGet = new SnakeServiceApiGet();

      String urlImg = await snakeServiceApiGet.downloadURL((txtNChip.text));

      Snake snake = new Snake();
      snake.chip = txtNChip.text;
      snake.procedencia = txtProcedencia.text;
      snake.especie = txtEspecie.text;
      snake.peso = txtPeso.text;
      snake.estado = txtEstado.text;
      snake.cidade = txtCidade.text;
      snake.sexo = txtSexo.text;
      snake.cpfDoador = txtDoadorCPF.text;
      snake.nomeDoador = txtDoadorNome.text;

      Map<String, dynamic> mapSerpente = {
        'chip': snake.chip,
        'procedencia': snake.procedencia,
        'especie': snake.especie,
        'peso': snake.peso,
        'estado': snake.estado,
        'cidade': snake.cidade,
        'sexo': snake.sexo,
        'cpfDoador': snake.cpfDoador,
        'nomeDoador': snake.nomeDoador,
        'img': urlImg,
      };

      bool result = await snakeServiceApiPost.addDado(
          colecao: 'serpentes', map: mapSerpente);

      if (result == true) {
        print("Cadastrado com sucesso");
        Navigator.push(
          context,
          PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 100),
              pageBuilder: (_, __, ___) => MenuPage()),
        );
      }
    }
  }
}
