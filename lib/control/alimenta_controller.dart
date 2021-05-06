import 'package:flutter/cupertino.dart';

class AlimentaController {
  //Atributos para armazenar os valores digitados pelo usuário
  var txtMicrochip = TextEditingController();
  var txtData = TextEditingController();
  var txtQuantidade = TextEditingController();
  var txtEspecie = TextEditingController();
  //Chave que identifica unicamente o formulário
  var formKey = GlobalKey<FormState>();
}
