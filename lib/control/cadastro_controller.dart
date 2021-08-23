
import 'package:projeto_reg_snake/data/service/snake_auth_service.dart';
import 'package:projeto_reg_snake/data/service/snake_service_api_post.dart';

class CadastroController{
   //Atributos para armazenar os valores digitados pelo usuário
  var txtNome ;
  var txtEmail;
  var txtCPF ;
  var txtSenha ;
  var formKey;
  SnakeAuthService snakeAuthService;
  SnakeServiceApiPost snakeServiceApiPost;

  CadastroController({this.snakeAuthService,this.snakeServiceApiPost,
  this.txtEmail,this.txtNome,this.txtCPF,this.txtSenha,this.formKey});



}