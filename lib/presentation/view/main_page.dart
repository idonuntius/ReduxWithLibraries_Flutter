import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_with_libraries_flutter/action/action.dart';
import 'package:redux_with_libraries_flutter/presentation/viewmodel/main_viewmodel.dart';
import 'package:redux_with_libraries_flutter/state/app_state.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, MainViewModel>(
      converter: (store) {
        return MainViewModel(
          count: store.state.count,
          onPlus: () => store.dispatch(IncrementCountAction()),
          onMinus: () => store.dispatch(DecrementCountAction()),
        );
      },
      builder: (context, viewmodel) {
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '${viewmodel.count}',
                  style: Theme.of(context).textTheme.display1,
                ),
                RaisedButton(
                  child: Text('plus'),
                  onPressed: viewmodel.onPlus,
                  color: Theme.of(context).primaryColor,
                ),
                RaisedButton(
                  child: Text('minus'),
                  onPressed: viewmodel.onMinus,
                  color: Theme.of(context).primaryColor,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
