import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_with_libraries_flutter/presentation/view/main_page.dart';
import 'package:redux_with_libraries_flutter/reducer/reducer.dart';
import 'package:redux_with_libraries_flutter/state/app_state.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  MyApp() : store = Store<AppState>(reducer, initialState: AppState.initialState());

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MainPage(),
      ),
    );
  }
}
