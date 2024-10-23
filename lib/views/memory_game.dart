import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/card_viewmodel.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MemoryGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Center(
        child: ChangeNotifierProvider(
          create: (_) => CardViewModel(),
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
                    height: 250,
                    child: GestureDetector(
                      onTap: () => viewModel.flipCard(card),
                      child: isFlipped
                        ? Image.asset(card.title)
                        : Image.asset(
                          'assets/card.png',
                        )
                    ),
                  );
                })
              ); //wrap
            }
          ),
        )
      );
  }
}
