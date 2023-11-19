import 'package:flutter/material.dart';
import 'package:flutter_favor/widget/app_state.dart';
import 'package:provider/provider.dart';
import 'package:flutter_favor/widget/localize.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();

    if (appState.favorites.isEmpty) {
      return Center(
        child: Text(Localize.noFavorYet(context)),
      );
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
              Localize.youHaveFavorites(context, appState.favorites.length)),
        ),
        for (var pair in appState.favorites)
          ElevatedButton(
            onPressed: () {
              appState.deleteFavorite(pair);
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
            child: ListTile(
              leading: Icon(Icons.favorite),
              title: Text(pair),
            ),
          )
      ],
    );
  }
}
