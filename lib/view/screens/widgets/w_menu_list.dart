import 'package:flutter/material.dart';
import 'package:projeto_reg_snake/data/models/m_menu.dart';
import 'package:projeto_reg_snake/view/screens/widgets/w_menu.dart';



class WMenuList extends StatelessWidget {
  final List<Menu> menuList;


  WMenuList({this.menuList});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex:1,
      child: GridView.count(
        crossAxisCount: MediaQuery.of(context).size.width>800 ? 4: MediaQuery.of(context).size.width<600?2:3,
        children: List.generate(menuList.length, (i) {
          return WMenu(menu:menuList[i]);
        }),
      )
    );
  }
}


