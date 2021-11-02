import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class FadeScaleTransitionDemo extends StatefulWidget {
  const FadeScaleTransitionDemo({Key? key}) : super(key: key);

  @override
  _FadeScaleTransitionDemoState createState() =>
      _FadeScaleTransitionDemoState();
}

class _FadeScaleTransitionDemoState extends State<FadeScaleTransitionDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fade')),
      body: ElevatedButton(
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
