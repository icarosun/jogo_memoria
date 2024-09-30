import 'package:flutter/material.dart';
import '../model/cardGame.dart';

class CardViewModel extends ChangeNotifier {
  List<CardGame> _cardsGame = [
    CardGame(title: "A", value: 1),
    CardGame(title: "B", value: 2),
    CardGame(title: "B", value: 2),
    CardGame(title: "A", value: 1),
    CardGame(title: "C", value: 3),
    CardGame(title: "C", value: 3),
  ];

  List<CardGame> flippedCards = [];

  bool isProcessing = false;

  CardViewModel() {
    _initGame();
  }

  void _initGame() {
    _cardsGame.shuffle();
    notifyListeners();
  }

  List<CardGame> get cardsGame => _cardsGame;
  
  void flipCard(CardGame card) {
    if (isProcessing || card.isFoundCouple || flippedCards.contains(card)) return;

    flippedCards.add(card);
    notifyListeners();

    if (flippedCards.length == 2) {
      isProcessing = true;
      notifyListeners();

      if (flippedCards[0].value == flippedCards[1].value) {
        flippedCards.forEach((c) => c.isFoundCouple = true);
      }

      Future.delayed(Duration(seconds: 1), () {
        flippedCards.clear();
        isProcessing = false;
        notifyListeners();
      });
    }
  }
}
