import 'package:animations/animations.dart';
import 'package:anims/pages/sample_pages/screen1.dart';
import 'package:anims/pages/sample_pages/screen2.dart';
import 'package:flutter/material.dart';

class SharedAxisTransitionDemo extends StatefulWidget {
  const SharedAxisTransitionDemo({Key? key}) : super(key: key);

  @override
  _SharedAxisTransitionDemoState createState() =>
      _SharedAxisTransitionDemoState();
}

class _SharedAxisTransitionDemoState extends State<SharedAxisTransitionDemo> {
  bool _isLoggedIn = false;

  void _toggleLoginStatus() {
    setState(() {
      _isLoggedIn = !_isLoggedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Container transform'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageTransitionSwitcher(
                duration: const Duration(milliseconds: 300),
                reverse: !_isLoggedIn,
                transitionBuilder: (
                  Widget child,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation,
                ) {
                  return SharedAxisTransition(
                    child: child,
                    animation: animation,
                    secondaryAnimation: secondaryAnimation,
                    transitionType: SharedAxisTransitionType.horizontal,
                  );
                },
                child: _isLoggedIn ? Screen2() : Screen1(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                TextButton(
                  onPressed: _isLoggedIn ? _toggleLoginStatus : null,
                  child: const Text('BACK'),
                ),
                ElevatedButton(
                  onPressed: _isLoggedIn ? null : _toggleLoginStatus,
                  child: const Text('NEXT'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
