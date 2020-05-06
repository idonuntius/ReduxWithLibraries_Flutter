import 'package:meta/meta.dart';

@immutable
class AppState {
  final int count;

  AppState({this.count});

  AppState.initialState() : count = 0;
}
