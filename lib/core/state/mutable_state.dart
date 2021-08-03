import 'package:flutter_riverpod/flutter_riverpod.dart';

class MutableStateNotifier<T> extends StateNotifier<T> {
  MutableStateNotifier(T state) : super(state);

  T get value {
    return state;
  }

  set value(T newState) {
    state = newState;
  }
}
