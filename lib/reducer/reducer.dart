import 'package:redux_with_libraries_flutter/action/action.dart';
import 'package:redux_with_libraries_flutter/state/app_state.dart';

AppState reducer(AppState state, action) {
  if (action is IncrementCountAction) {
    return AppState(count: state.count + 1);
  }
  if (action is DecrementCountAction) {
    return AppState(count: state.count - 1);
  }
  return AppState(count: state.count);
}
