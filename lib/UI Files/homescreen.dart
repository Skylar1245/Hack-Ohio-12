import 'package:flutter/material.dart';
import 'package:hackohio12/UI%20Files/medicalbaseClass.dart';
import 'package:hackohio12/global_methods.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Divider divider = Divider(height: 40, color: Colors.transparent);
    Divider buttonDivider = Divider(height: 20, color: Colors.transparent);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Global.appBar(),
          title: Text(widget.title),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        20), // Adjust the radius as needed
                    color: const Color.fromARGB(255, 17, 93, 136),
                  ),
                  constraints: BoxConstraints.expand(
                    height:
                        Theme.of(context).textTheme.headlineMedium!.fontSize! *
                                1.1 +
                            200.0,
                  ),
                  //padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.bottomCenter,
                  width: 375,
                  child: Column(
                    children: [
                      Text('Sun', style: TextStyle(fontSize: 30),),
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                20), // Adjust the radius as needed
                            color: const Color.fromARGB(255, 211, 98, 98),
                          ),
                          //padding: const EdgeInsets.all(8.0),
                          alignment: Alignment.center,
                          width: 375,
                          child: Text('Weekly forecast'))
                    ],
                  )),
              divider,
              Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            20), // Adjust the radius as needed
                        color: const Color.fromARGB(255, 201, 9, 9),
                      ),
                      //padding: const EdgeInsets.all(8.0),
                      alignment: Alignment.bottomCenter,
                      width: 375,
                      child: ListView(
                          padding: const EdgeInsets.all(8),
                          children: <Widget>[
                            FloatingActionButton.extended(
                              heroTag: "1",
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const Medicalbaseclass(
                                              title: 'Medical')),
                                );
                              },
                              label: Text('Migraines'),
                              icon: Icon(Icons.thumb_down),
                              backgroundColor: Colors.pink,
                            ),
                            buttonDivider,
                            FloatingActionButton.extended(
                              heroTag: "2",
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const Medicalbaseclass(
                                              title: 'Medical')),
                                );
                              },
                              label: Text('Asthma'),
                              icon: Icon(Icons.thumb_down),
                              backgroundColor: Colors.pink,
                            ),
                            buttonDivider,
                            FloatingActionButton.extended(
                              heroTag: "3",
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const Medicalbaseclass(
                                              title: 'Medical')),
                                );
                              },
                              label: Text('Arthritis'),
                              icon: Icon(Icons.thumb_down),
                              backgroundColor: Colors.pink,
                            )
                          ])))
            ]));
  }
}
