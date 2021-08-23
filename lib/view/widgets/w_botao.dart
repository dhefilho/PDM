
import 'package:flutter/material.dart';
import 'package:projeto_reg_snake/view/screens/menu_page.dart';



class WBotao extends StatelessWidget{
  String rotulo;

  WBotao({this.rotulo});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        child: Text(rotulo, style: TextStyle(fontSize: 18)),

        onPressed: (){
          Navigator.push(
            context, PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 400),
              pageBuilder: (_, __, ___) => MenuPage()),
          );
        },
      ),
    );
    ;

  }


}