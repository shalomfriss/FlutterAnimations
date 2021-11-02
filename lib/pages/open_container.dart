import 'package:animations/animations.dart';
import 'package:anims/pages/sample_pages/sample_page.dart';
import 'package:flutter/material.dart';

class OpenContainerTransformDemo extends StatefulWidget {
  const OpenContainerTransformDemo({Key? key}) : super(key: key);

  @override
  _OpenContainerTransformDemoState createState() =>
      _OpenContainerTransformDemoState();
}

class _OpenContainerTransformDemoState
    extends State<OpenContainerTransformDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Container transform'),
      ),
      body: ListView(padding: const EdgeInsets.all(8.0), children: <Widget>[
        OpenContainer<bool>(
          transitionType: ContainerTransitionType.fade,
          openBuilder: (BuildContext context, VoidCallback _) {
            return SamplePage(
              pageColor: Colors.red,
            );
          },
          tappable: true,
          closedBuilder: (BuildContext context, VoidCallback _) {
            return Container(
                width: double.infinity, height: 50, color: Colors.red);
          },
        ),
        const SizedBox(height: 8.0),
        OpenContainer<bool>(
          transitionType: ContainerTransitionType.fade,
          openBuilder: (BuildContext context, VoidCallback _) {
            return SamplePage(
              pageColor: Colors.green,
            );
          },
          tappable: true,
          closedBuilder: (BuildContext context, VoidCallback _) {
            return Container(
                width: double.infinity, height: 50, color: Colors.green);
          },
        ),
      ]),
    );
  }
}

/*

OpenContainer<bool>(
        transitionType: ContainerTransitionType.fade,
        openBuilder: (BuildContext context, VoidCallback _) {
          return Container(width: 400, height: 400, color: Colors.red);
        },
        onClosed: (marked) {},
        tappable: false,
        closedBuilder: (BuildContext _, VoidCallback openContainer) {
          return Container(width: 400, height: 400, color: Colors.green);
        },
      ),
 */
