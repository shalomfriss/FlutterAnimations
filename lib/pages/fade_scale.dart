import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class FadeScaleTransitionDemo extends StatefulWidget {
  const FadeScaleTransitionDemo({Key? key}) : super(key: key);

  @override
  _FadeScaleTransitionDemoState createState() =>
      _FadeScaleTransitionDemoState();
}

class _FadeScaleTransitionDemoState extends State<FadeScaleTransitionDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      value: 0.0,
      duration: const Duration(milliseconds: 150),
      reverseDuration: const Duration(milliseconds: 75),
      vsync: this,
    )..addStatusListener((AnimationStatus status) {
        setState(() {
          // setState needs to be called to trigger a rebuild because
          // the 'HIDE FAB'/'SHOW FAB' button needs to be updated based
          // the latest value of [_controller.status].
        });
      });
    super.initState();
  }

  bool get _isAnimationRunningForwardsOrComplete {
    switch (_controller.status) {
      case AnimationStatus.forward:
      case AnimationStatus.completed:
        return true;
      case AnimationStatus.reverse:
      case AnimationStatus.dismissed:
        return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fade')),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              if (_isAnimationRunningForwardsOrComplete) {
                _controller.reverse();
              } else {
                _controller.forward();
              }
            },
            child: _isAnimationRunningForwardsOrComplete
                ? const Text('HIDE FAB')
                : const Text('SHOW FAB'),
          ),
          AnimatedBuilder(
            animation: _controller,
            builder: (BuildContext context, Widget? child) {
              return FadeScaleTransition(
                animation: _controller,
                child: child,
              );
            },
            child: Visibility(
              visible: _controller.status != AnimationStatus.dismissed,
              child: FloatingActionButton(
                child: const Icon(Icons.add),
                onPressed: () {},
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              //This function is in the animation library and creates a fade scale animation
              //https://pub.dev/documentation/animations/latest/animations/showModal.html
              showModal<void>(
                context: context,
                builder: (BuildContext context) {
                  return _ExampleAlertDialog();
                },
              );
            },
            child: const Text('SHOW MODAL'),
          ),
        ],
      ),
    );
  }
}

class _ExampleAlertDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: const Text('Alert Dialog'),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('CANCEL'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('DISCARD'),
        ),
      ],
    );
  }
}
