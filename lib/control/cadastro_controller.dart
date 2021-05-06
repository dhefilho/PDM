import 'package:flutter/cupertino.dart';

class CadastroController{
   //Atributos para armazenar os valores digitados pelo usuário
  var txtNome = TextEditingController();
  var txtEmail = TextEditingController();
  var txtCPF = TextEditingController();
  var txtSenha = TextEditingController();
  //Chave que identifica unicamente o formulário
  var formKey = GlobalKey<FormState>();


}