import 'package:flutter/material.dart';
import 'pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp( // MaterialApp configura e constrói a base do meu app Flutter, definindo título, tema visual e a tela inicial.
      title: 'Matematicando',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primarySwatch: Colors.teal,
        useMaterial3: true,
      ),

      home: const HomePage(),
    );
  }
}