import 'package:flutter_favor/database/database.dart';

class FavoriteDao {
  final database = AppDatabase();

  void insert(String favorite) async {
    await database
        .into(database.favorite)
        .insert(FavoriteCompanion.insert(favorite: favorite));
  }

  void delete(String favorite) async {
    (database.delete(database.favorite)
          ..where((tbl) => tbl.favorite.equals(favorite)))
        .go();
  }

  Future<List<FavoriteData>> getAll() async {
    List<FavoriteData> items = await database.select(database.favorite).get();
    return items;
  }

  Future<List<FavoriteData>> getFavorites(String favorite) async {
    List<FavoriteData> items = await (database.select(database.favorite)
          ..where((tbl) => tbl.favorite.equals(favorite)))
        .get();
    return items;
  }
}
