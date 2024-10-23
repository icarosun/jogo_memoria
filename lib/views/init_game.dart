import 'package:flutter/material.dart';

class InitGame extends StatelessWidget {
  final VoidCallback onStartGame;

  InitGame({required this.onStartGame});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "JOGO DA MEMÓRIA",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 100,
                color: Colors.blueAccent,
                fontWeight: FontWeight.w900),
          ),
          Text(
            "Vamos jogar?",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: Size(100, 100),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.zero))),
              onPressed: onStartGame,
              child: Text(
                "Iniciar",
                style: TextStyle(color: Colors.white, fontSize: 50),
              )),
        ],
      ),
    );
  }
}
