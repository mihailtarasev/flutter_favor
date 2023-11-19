import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_favor/widget/sound_service.dart';
import 'package:flutter_favor/database/dao/favorite_dao.dart';

class AppState extends ChangeNotifier {
  var dao = FavoriteDao();
  var current = WordPair.random();
  var soundService = SoundService();
  bool isShake = false;

  void shake() {
    isShake = true;
    Future.delayed(Duration(milliseconds: 300), () {
      isShake = false;
      notifyListeners();
    });
  }

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
