import 'package:flutter/material.dart';
import 'package:redux_with_libraries_flutter/presentation/view/counter_page.dart';
import 'package:redux_with_libraries_flutter/presentation/view/result_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildStackedPagesWidget(),
      bottomNavigationBar: _buildBottomNavigationBarWidget(),
    );
  }

  Widget _buildStackedPagesWidget() {
    return Stack(
      children: <Widget>[
        _buildOffstageWidget(0, CounterPage()),
        _buildOffstageWidget(1, ResultPage()),
      ],
    );
  }

  Widget _buildOffstageWidget(int index, Widget page) {
    return Offstage(
      offstage: index != _currentIndex,
      child: TickerMode(
        enabled: index == _currentIndex,
        child: page,
      ),
    );
  }

  Widget _buildBottomNavigationBarWidget() {
    return BottomNavigationBar(
      onTap: (index) {
        setState(() => _currentIndex = index);
      },
      currentIndex: _currentIndex,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('counter'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.note),
          title: Text('result'),
        ),
      ],
    );
  }
}
