import 'package:flutter/material.dart';
import 'package:hackohio12/UI%20Files/medicalbaseClass.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _SkeletonState();
}

class _SkeletonState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            constraints: BoxConstraints.expand(
              height:
                  Theme.of(context).textTheme.headlineMedium!.fontSize! * 1.1 +
                      200.0,
            ),
            padding: const EdgeInsets.all(8.0),
            color: Colors.blue[600],
            alignment: Alignment.bottomCenter,
            child: Text('Im weather box',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: Colors.white)),
          ),
          Expanded(
              child: Container(
                  padding: const EdgeInsets.all(8.0),
                  color: Colors.red[600],
                  alignment: Alignment.bottomCenter,
                  child: Column(children: <Widget>[
                    FloatingActionButton.extended(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const Medicalbaseclass(title: 'Medical')),
                    );
                      },
                      label: Text('Migraines'),
                      icon: Icon(Icons.thumb_down),
                      backgroundColor: Colors.pink,
                    )
                  ])))
        ],
      ),
    );
  }
}
