
import 'package:projeto_reg_snake/shared/data/service/snake_service_api_post.dart';

class AlimentaController {
  //Atributos para armazenar os valores digitados pelo usuário
  var txtMicrochip;
  var txtData;
  var txtQuantidade;
  var txtEspecie;
  //Chave que identifica unicamente o formulário
  var formKey;

  SnakeServiceApiPost snakeServiceApiPost;

  AlimentaController({this.snakeServiceApiPost,this.txtMicrochip,
  this.txtData,this.txtQuantidade,this.txtEspecie,this.formKey});

}
