import 'package:flutter/material.dart';
import 'package:flutter_favor/widget/app_state.dart';
import 'package:provider/provider.dart';
import 'package:flutter_favor/widget/localize.dart';
import 'package:flutter_favor/widget/big_card.dart';
import 'package:flutter_shake_animated/flutter_shake_animated.dart';

class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    var pair = appState.current;

    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Scaffold(
        backgroundColor: Colors.lime,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShakeWidget(
                shakeConstant: ShakeLittleConstant1(),
                autoPlay: appState.isShake,
                enableWebMouseHover: true,
                child: BigCard(pair: pair),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      appState.playSound();
                      appState.toggleFavorite();
                      appState.shake();
                    },
                    icon: Icon(icon),
                    label: Text(Localize.like(context)),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      appState.playSound();
                      appState.getNext();
                    },
                    child: Text(Localize.next(context)),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
