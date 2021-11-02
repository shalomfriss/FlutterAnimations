import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class FadeThroughTransitionDemo extends StatefulWidget {
  const FadeThroughTransitionDemo({Key? key}) : super(key: key);

  @override
  _FadeThroughTransitionDemoState createState() =>
      _FadeThroughTransitionDemoState();
}

class _FadeThroughTransitionDemoState extends State<FadeThroughTransitionDemo> {
  int pageIndex = 0;
  List<Widget> pageList = <Widget>[
    _FirstPage(),
    _SecondPage(),
    _ThirdPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fade through')),
      body: PageTransitionSwitcher(
        transitionBuilder: (
          Widget child,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
        ) {
          return FadeThroughTransition(
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            child: child,
          );
        },
        child: pageList[pageIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        onTap: (int newValue) {
          setState(() {
            pageIndex = newValue;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_library),
            label: 'Albums',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo),
            label: 'Photos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
        ],
      ),
    );
  }
}

class _FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(width: 300, height: 100, color: Colors.yellow)
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(width: 300, height: 100, color: Colors.green)
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(width: 300, height: 100, color: Colors.blue)
            ],
          ),
        ),
      ],
    );
  }
}

class _SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(child: Container(width: 100, height: 100, color: Colors.red))
      ],
    );
  }
}

class _ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text('List item ${index + 1}'),
          subtitle: const Text('Secondary text'),
        );
      },
      itemCount: 10,
    );
  }
}
