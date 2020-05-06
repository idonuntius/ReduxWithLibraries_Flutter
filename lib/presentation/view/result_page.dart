import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_with_libraries_flutter/presentation/viewmodel/result_viewmodel.dart';
import 'package:redux_with_libraries_flutter/state/app_state.dart';

class ResultPage extends StatefulWidget {
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ResultViewModel>(
      converter: (store) {
        return ResultViewModel(
          count: store.state.counter.count,
        );
      },
      builder: (context, viewModel) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Counter'),
          ),
          body: Center(
            child: Text(
              '${viewModel.count}',
              style: Theme.of(context).textTheme.display1,
            ),
          ),
        );
      },
    );
  }
}
