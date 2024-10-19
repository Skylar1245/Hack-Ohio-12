import 'package:flutter/material.dart';

class Medicalbaseclass extends StatefulWidget {
  const Medicalbaseclass({super.key, required this.title});

  final String title;

  @override
  State<Medicalbaseclass> createState() => _SkeletonState();
}

class _SkeletonState extends State<Medicalbaseclass> {
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
