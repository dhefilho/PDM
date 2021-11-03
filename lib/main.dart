import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projeto_reg_snake/shared/resources/custom_colors.dart';
import 'view/screens/home_page.dart';

Future<void> main() async {
  await Firebase.initializeApp();
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
        primaryColor: CustomColors.greenHeavy,
        backgroundColor: CustomColors.greyLight,
        fontFamily: 'Open Sans',
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 22,
            color: CustomColors.white,
            fontStyle: FontStyle.italic,
          ),
          headline2: TextStyle(
            fontSize: 18,
            color: CustomColors.greenHeavy,
          ),
        ),
      ),
    );
  }
}
