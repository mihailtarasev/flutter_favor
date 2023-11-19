import 'package:flutter_favor/database/database.dart';

class FavoriteDao {
  final database = AppDatabase();

  void insert(String favorite) async {
    await database
        .into(database.favorite)
        .insert(FavoriteCompanion.insert(favorite: favorite));
  }

  List<FavoriteData> getAll() async {
    List<FavoriteData> allItems =
        await database.select(database.favorite).get();
    return allItems;
  }
}
