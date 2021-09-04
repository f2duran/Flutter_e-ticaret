import 'package:e_ticaret/home.dart';
import 'package:flutter/material.dart';

void main() {
  //uygulamayı çalıştıran fonksiyon
  runApp(
      MyApp()); //hangi widget ile uygulamanın çalıştırılacağını söyleyen fonksiyon
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
