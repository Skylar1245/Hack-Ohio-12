import 'package:flutter/material.dart';
import 'package:hackohio12/global_methods.dart';

class Medicalbaseclass extends StatefulWidget {
  const Medicalbaseclass({super.key, required this.title});

  final String title;

  @override
  State<Medicalbaseclass> createState() => _SkeletonState();
}

class _SkeletonState extends State<Medicalbaseclass> {
  @override
  Widget build(BuildContext context) {
    Divider divider = Divider(
        height: Global.getHeightByPercentage(context, 4),
        color: Colors.transparent);
    Decoration decoration = BoxDecoration(
      gradient: Global.gradient(),
      borderRadius: BorderRadius.circular(20), // Adjust the radius as needed
      color: const Color.fromARGB(255, 17, 93, 136),
    );
    return Scaffold(
      backgroundColor: Global.background(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            divider,
            Container(
                decoration: decoration,
                alignment: Alignment.center,
                width: 375,
                height: 100,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Chances of Flare Up:",
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 20)),
                      Container(
                          width: 70,
                          height: 70,
                          color: Color.fromARGB(255, 255, 255, 255))
                    ])),
            divider,
            Container(
                decoration: decoration,
                alignment: Alignment.center,
                width: 375,
                height: 500,
                child: Text("graph")),
            divider,
            Container(
                decoration: decoration,
                width: 375,
                height: 500,
                alignment: Alignment.bottomCenter,
                child: Text("more information"))
          ],
        ),
      ),
    );
  }
}
