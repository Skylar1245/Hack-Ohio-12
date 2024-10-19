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
    Divider divider = Divider(height: 40, color: Colors.transparent);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            divider,
            Container(
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(20), // Adjust the radius as needed
                  color: const Color.fromARGB(255, 17, 93, 136),
                ),
                alignment: Alignment.center,
                width: 375,
                height: 100,
                child: Text("percent chance")),
                divider,
            Container(
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(20), // Adjust the radius as needed
                  color: const Color.fromARGB(255, 17, 93, 136),
                ),
                alignment: Alignment.center,
                width: 375,
                height: 500,
                child: Text("percent chance")),
                divider,
            Container(
                padding: const EdgeInsets.all(8.0),
                color: Colors.red[600],
                alignment: Alignment.bottomCenter,
                child: Text("more information"))
          ],
        ),
      ),
    );
  }
}
