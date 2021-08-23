import 'package:flutter/cupertino.dart';
import 'package:projeto_reg_snake/data/models/snake.dart';
import 'package:projeto_reg_snake/data/service/snake_service_api_get.dart';

class ConsultaController {
  //Atributos para armazenar os valores digitados pelo usuário
  var txtMicrochip = TextEditingController();
  var txtEspecie = TextEditingController();
  var txtDataRegI = TextEditingController();
  var txtDataRegF = TextEditingController();
  //Chave que identifica unicamente o formulário
  var formKey = GlobalKey<FormState>();
  String nomeEspecie = "";
  var especies = [
    'Crotallus durissus terrificus',
    'Bothrops jararaca',
    'Bothrops moojnei',
    'Bothrops alternatus',
    'Python bivittatus'
  ];
  var itemSelecionado = 'Crotallus durissus terrificus';
  //DateTime _selectedValue = DateTime.now();
  DateTime data;
  String content = "";
  String scanBarcode = "";

  SnakeServiceApiGet snakeServiceApiGet;

  ConsultaController({this.snakeServiceApiGet});

  void getSnake() async {
    var result = await snakeServiceApiGet.consultaDado(
        "serpentes", "chip", txtMicrochip.text);
    Snake snake = new Snake();
    snake.nomeDoador = result['nomeDoador'];
    snake.cpfDoador = result["cpfDoador"];
    snake.sexo = result["sexo"];
    snake.cidade = result["cidade"];
    snake.estado = result["estado"];
    snake.especie = result['especie'];
    snake.chip = result['chip'];
    snake.procedencia = result['procedencia'];
    snake.img = result['img'];
    snake.peso = result['peso'];
  }
}
