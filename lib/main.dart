import 'package:flutter/material.dart';
import 'view/screens/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
        home: MyHomePage(title: 'Flutter Demo Home Page'),
        theme: ThemeData(
            primaryColor: Colors.blue[900],
            backgroundColor: Colors.grey[100],
            fontFamily: 'Open Sans',
            textTheme: TextTheme(
                headline1: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontStyle: FontStyle.italic),
                headline2: TextStyle(fontSize: 18, color: Colors.blue[900]))

    ));
  }
}

