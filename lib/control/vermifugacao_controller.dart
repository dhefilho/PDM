import 'package:projeto_reg_snake/shared/data/service/snake_service_api_post.dart';

////////////////////////////////////////////////////////////
//Código do chip; data da vermifugação e medicamento usado//
////////////////////////////////////////////////////////////

class VermifugacaoController {
  //Atributos para armazenar os valores digitados pelo usuário
  var txtMicrochip;
  var txtData;
  var txtMedicaVerm;
  //Chave que identifica unicamente o formulário
  var formKey;

  SnakeServiceApiPost snakeServiceApiPost;

  VermifugacaoController({
    this.snakeServiceApiPost,
    this.txtData,
    this.txtMicrochip,
    this.txtMedicaVerm,
    this.formKey,
  });
}
