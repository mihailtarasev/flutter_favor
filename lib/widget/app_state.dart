import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_favor/database/database.dart';
import 'package:flutter_favor/widget/sound_service.dart';
import 'package:flutter_favor/database/dao/favorite_dao.dart';

class AppState extends ChangeNotifier {
  var dao = FavoriteDao();
  String current = WordPair.random().toString();
  var soundService = SoundService();
  bool isShake = false;

  AppState() {
    getAll().then((value) => {favorites.addAll(value.map((e) => e.favorite))});
  }

  void insertNext() async {
    if (favorites.contains(current)) {
      dao.insert(favorites.last);
    }
  }

  Future<List<FavoriteData>> getAll() => dao.getAll();

  void deleteFavorite(favorite) {
    dao.delete(favorite);
    favorites.removeWhere((element) => element == favorite);
    notifyListeners();
  }

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
    current = WordPair.random().toString();
    notifyListeners();
  }

  var favorites = <String>[];

  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }
}
