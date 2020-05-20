import 'package:meta/meta.dart';
import 'package:redux_with_libraries_flutter/state/counter_state.dart';

@immutable
class AppState {
  final CounterState counter;

  AppState({this.counter});

  factory AppState.initialState() {
    return AppState(
      counter: CounterState(),
    );
  }
}
