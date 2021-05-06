import 'package:flutter/cupertino.dart';

class ConsultaController{
   //Atributos para armazenar os valores digitados pelo usuário
  var txtMicrochip = TextEditingController();
  var txtEspecie = TextEditingController();
  var txtDataRegI = TextEditingController();
  var txtDataRegF = TextEditingController();
  //Chave que identifica unicamente o formulário
  var formKey = GlobalKey<FormState>();


}