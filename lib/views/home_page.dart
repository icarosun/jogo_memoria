import 'package:flutter/material.dart';
import './memory_game.dart';
import './init_game.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isQuizzVisible = false;

  void _startQuizzGame() {
    setState(() {
      _isQuizzVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/fundo_semig.png'),
            fit: BoxFit.fill,
          )),
        ),
        if (_isQuizzVisible)
          MemoryGame()
        else
          InitGame(
            onStartGame: _startQuizzGame,
          )
      ]),
      floatingActionButton: _isQuizzVisible
          ? FloatingActionButton.large(
              onPressed: () {
                setState(() {
                  _isQuizzVisible = false;
                });
              },
              child: const Icon(Icons.restart_alt),
            )
          : null,
    );
  }
}
