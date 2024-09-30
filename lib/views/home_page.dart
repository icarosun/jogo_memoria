import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/card_viewmodel.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(title: Text("Jogo da Memória - SEMIG")),
      body: Center(
        child: Consumer<CardViewModel>(
          builder: (context, viewModel, child) {
            return Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: List.generate(viewModel.cardsGame.length, (index) {
                final card = viewModel.cardsGame[index];
                final isFlipped = viewModel.flippedCards.contains(card) || card.isFoundCouple;
                
                return Container(
                  width: 200, 
                  height: 200,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: isFlipped 
                        ? Colors.grey
                        : Colors.blue,
                      textStyle: TextStyle(fontSize: 54, height: 1.1),  
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                    ),
                    onPressed: () => viewModel.flipCard(card),
                    child: isFlipped 
                      ? Text(card.title)
                      : Text("")
                  )//textbutton
                );
              })
            ); //wrap
          }
        )
      )
    );
  }
}
