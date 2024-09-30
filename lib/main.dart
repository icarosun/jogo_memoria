import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './viewmodels/card_viewmodel.dart';
import 'views/home_page.dart'; 
import 'model/cardGame.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CardViewModel(),
      child: MaterialApp(
        title: 'Jogo da memória SEMIG',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      )
    );
  }
}

