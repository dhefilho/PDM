

import 'package:flutter/cupertino.dart';

class SobreController{
   //Atributos para armazenar os valores digitados pelo usuário
  var txtNome = TextEditingController();
  var txtFoto = TextEditingController();
  var txtDescricao = TextEditingController();

  //Chave que identifica unicamente o formulário
  var formKey = GlobalKey<FormState>();


}