import 'package:meta/meta.dart';

@immutable
class CounterState {
  final int count;

  CounterState({this.count = 0});
}
