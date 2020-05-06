import 'package:redux_with_libraries_flutter/action/action.dart';
import 'package:redux_with_libraries_flutter/state/counter_state.dart';

CounterState counterReducer(CounterState state, action) {
  if (action is IncrementCountAction) {
    return CounterState(count: state.count + 1);
  }
  if (action is DecrementCountAction) {
    return CounterState(count: state.count - 1);
  }
  return CounterState(count: state.count);
}
