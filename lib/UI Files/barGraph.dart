import 'package:flutter/material.dart';

class BarGraph extends StatefulWidget {
  const BarGraph({super.key, required this.title});

  final String title;

  @override
  State<BarGraph> createState() => _BarGraph();
}

class _BarGraph extends State<BarGraph> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ),
    );
  }
}
