import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_with_libraries_flutter/action/action.dart';
import 'package:redux_with_libraries_flutter/presentation/viewmodel/counter_viewmodel.dart';
import 'package:redux_with_libraries_flutter/state/app_state.dart';

class CounterPage extends StatefulWidget {
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, CounterViewModel>(
      converter: (store) {
        return CounterViewModel(
          count: store.state.counter.count,
          onPlus: () => store.dispatch(IncrementCountAction()),
          onMinus: () => store.dispatch(DecrementCountAction()),
        );
      },
      builder: (context, viewModel) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Counter'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '${viewModel.count}',
                  style: Theme.of(context).textTheme.display1,
                ),
                RaisedButton(
                  child: Text('plus'),
                  onPressed: viewModel.onPlus,
                  color: Theme.of(context).primaryColor,
                ),
                RaisedButton(
                  child: Text('minus'),
                  onPressed: viewModel.onMinus,
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
