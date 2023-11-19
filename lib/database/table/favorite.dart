import 'package:drift/drift.dart';

class Favorite extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get favorite => text()();
}
