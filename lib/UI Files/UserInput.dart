import 'package:flutter/material.dart';

class UserInput extends StatefulWidget {
  const UserInput({super.key, required this.title});

  final String title;

  @override
  State<UserInput> createState() => _SkeletonState();
}

class _SkeletonState extends State<UserInput> {
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
          children: <Widget>[Text("hello world")],
        ),
      ),
    );
  }
}
