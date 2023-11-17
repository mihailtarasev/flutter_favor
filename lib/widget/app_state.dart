import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_favor/sound_service.dart';

class AppState extends ChangeNotifier {
  var current = WordPair.random();
  var soundService = SoundService();

  void playSound() async {
    soundService.play();
  }

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  var favorites = <WordPair>[];

  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }
}
