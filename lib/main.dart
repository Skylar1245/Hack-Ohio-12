import 'package:flutter/material.dart';
import 'package:hackohio12/UI%20Files/homescreen.dart';
import 'package:hackohio12/global_methods.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of our application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: FutureBuilder(
            future: Global.weatherData.initialize(),
            builder: (context, snapshot) {
              if (snapshot.data == true) {
                return const HomeScreen(title: 'Home Screen');
              } else {
                return const Scaffold(
                    body: Center(child: CircularProgressIndicator()));
              }
            }));
  }
}
