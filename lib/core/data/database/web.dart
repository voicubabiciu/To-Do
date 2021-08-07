import 'package:moor/moor_web.dart';
import 'package:to_do/core/data/moor_database.dart';

import '../moor_database.dart';

AppDatabase constructDb({bool logStatements = false}) {
  return AppDatabase(WebDatabase('db', logStatements: logStatements));
}
