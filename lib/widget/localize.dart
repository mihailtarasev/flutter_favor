import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Localize {
  static String mainAppTitle(context) =>
      AppLocalizations.of(context)!.mainAppTitle;
  static String noFavorYet(context) => AppLocalizations.of(context)!.noFavorYet;
  static String like(context) => AppLocalizations.of(context)!.like;
  static String next(context) => AppLocalizations.of(context)!.next;
  static String home(context) => AppLocalizations.of(context)!.home;
  static String favorites(context) => AppLocalizations.of(context)!.favorites;
  static String noWidgetFor(context, selectedIndex) =>
      AppLocalizations.of(context)!.noWidgetFor(selectedIndex);
  static String youHaveFavorites(context, length) =>
      AppLocalizations.of(context)!.youHaveFavorites(length);
}
