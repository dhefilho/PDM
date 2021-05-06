
import 'package:flutter/cupertino.dart';

class SerpenteController{
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
  //Chave que identifica unicamente o formulário
  var formKey = GlobalKey<FormState>();


}