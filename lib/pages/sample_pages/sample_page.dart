import 'package:flutter/material.dart';

class SamplePage extends StatefulWidget {
  final Color pageColor;

  const SamplePage({Key? key, required this.pageColor}) : super(key: key);

  @override
  _SamplePageState createState() => _SamplePageState();
}

class _SamplePageState extends State<SamplePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Container transform'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: widget.pageColor,
        child: Center(child: Text("this is a page")),
      ),
    );
  }
}
