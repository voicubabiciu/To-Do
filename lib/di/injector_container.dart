import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/data/moor_database.dart';

// * Core providers
final Provider<AppDatabase> db = Provider<AppDatabase>((_) {
  return constructDb();
});
