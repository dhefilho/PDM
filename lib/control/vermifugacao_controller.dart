import 'package:flutter/cupertino.dart';

////////////////////////////////////////////////////////////
//Código do chip; data da vermifugação e medicamento usado//
////////////////////////////////////////////////////////////

class VermifugacaoController {
  //Atributos para armazenar os valores digitados pelo usuário
  var txtMicrochip = TextEditingController();
  var txtData = TextEditingController();
  var txtMedicaVerm = TextEditingController();

  //Chave que identifica unicamente o formulário
  var formKey = GlobalKey<FormState>();
}
