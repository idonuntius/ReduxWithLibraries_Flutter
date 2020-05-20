import 'package:redux_with_libraries_flutter/reducer/counter_reducer.dart';
import 'package:redux_with_libraries_flutter/state/app_state.dart';

AppState reducer(AppState state, action) {
  return AppState(
    counter: counterReducer(state.counter, action),
  );
}
