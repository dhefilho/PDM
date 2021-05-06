import 'package:flutter/material.dart';

class WCampoTexto extends StatelessWidget {
  final TextEditingController variavel;
  final String rotulo;
  final bool eSenha;
  final IconButton icon;


  WCampoTexto({this.variavel, this.rotulo, this.eSenha, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6),
      child: TextFormField(
        controller: variavel,
        style: TextStyle(fontSize: 24),
        obscureText: eSenha,

        decoration: InputDecoration(
          labelText: rotulo,
          labelStyle: TextStyle(fontSize: 16),
          hintText: 'Insira as informações',
          hintStyle: TextStyle(fontSize: 16),
          suffixIcon: icon != null ? icon : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),

        //validar a entrada de dados
        validator: (value) {
          value = value.replaceFirst(',', '.');
          if (double.tryParse(value) == null) {
          return 'Entre com uma informação';
          } else {
            return null;
          }
        },
      ),
    );
  }
}
