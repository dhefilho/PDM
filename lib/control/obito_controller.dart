import 'package:projeto_reg_snake/shared/data/service/snake_service_api_post.dart';

class ObitoController{
   //Atributos para armazenar os valores digitados pelo usuário
  var txtData;
  var txtMicrochip;
  var txtCausa;
  //Chave que identifica unicamente o formulário
  var formKey;



  SnakeServiceApiPost snakeServiceApiPost;

  ObitoController({this.snakeServiceApiPost,this.txtData,
  this.txtMicrochip,this.txtCausa,this.formKey});


}