import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ExibirSerpente extends StatelessWidget{
  QueryDocumentSnapshot document;

  ExibirSerpente({this.document});
  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(5),
      child: ListTile(
        title: Text(document['especie'], style: TextStyle(fontSize: 24)),
        subtitle: Text('Peso ${document['peso']}', style: TextStyle(fontSize: 22)),
      ),
    );
  }
  
}