import 'package:flutter/material.dart';
import 'inicio.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  Widget build (BuildContext context){
    return MaterialApp(
      title: "CastleSoft",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amberAccent),
        useMaterial3: true,
      ),
      home: InicioHome(),
    ) ;
  }
}








