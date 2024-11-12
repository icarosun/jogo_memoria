import 'package:flutter/material.dart';
import '../model/cardGame.dart';

class CardViewModel extends ChangeNotifier {
  List<CardGame> _cardsGame = [
    CardGame(url: "assets/calcario.png", value: 1),
    CardGame(url: "assets/calcario.png", value: 1),
    CardGame(url: "assets/energia_eletrica.png", value: 2),
    CardGame(url: "assets/energia_eletrica.png", value: 2),
    CardGame(url: "assets/energia_eolica.png", value: 3),
    CardGame(url: "assets/energia_eolica.png", value: 3),
    CardGame(url: "assets/energia_solar.png", value: 4),
    CardGame(url: "assets/energia_solar.png", value: 4),
    CardGame(url: "assets/gas_helio.png", value: 5),
    CardGame(url: "assets/gas_helio.png", value: 5),
    CardGame(url: "assets/glp.png", value: 6),
    CardGame(url: "assets/glp.png", value: 6),
    CardGame(url: "assets/gnv.png", value: 7),
    CardGame(url: "assets/gnv.png", value: 7),
    CardGame(url: "assets/ouro.png", value: 8),
    CardGame(url: "assets/ouro.png", value: 8),
    CardGame(url: "assets/potassio.png", value: 9),
    CardGame(url: "assets/potassio.png", value: 9),
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
