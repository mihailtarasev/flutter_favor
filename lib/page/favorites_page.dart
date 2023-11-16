import 'package:flutter/material.dart';
import 'package:flutter_favor/widget/app_state.dart';
import 'package:provider/provider.dart';
import 'package:flutter_favor/widget/constant.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();

    if (appState.favorites.isEmpty) {
      return Center(
        child: Text(Constant.noFavorYet),
      );
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('You have '
              '${appState.favorites.length} favorites:'),
        ),
        for (var pair in appState.favorites)
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text(pair.asLowerCase),
          ),
      ],
    );
  }
}
