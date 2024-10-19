import 'package:flutter/material.dart';
import 'package:hackohio12/global_methods.dart';

class DataPage extends StatefulWidget {
  const DataPage(
      {super.key,
      required this.title,
      required this.percent,
      required this.description});

  final String title;
  final int percent;
  final String description;

  @override
  State<DataPage> createState() => _SkeletonState();
}

class _SkeletonState extends State<DataPage> {
  @override
  Widget build(BuildContext context) {
    Decoration decoration = BoxDecoration(
      gradient: Global.gradient(),
      borderRadius: BorderRadius.circular(20), // Adjust the radius as needed
    );

    return Scaffold(
      backgroundColor: Global.background(),
      appBar: AppBar(
        backgroundColor: Global.appBar(),
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Global.divider(context),
            Container(
                decoration: decoration,
                alignment: Alignment.center,
                width: Global.getWidthByPercentage(context, 90),
                height: Global.getHeightByPercentage(context, 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Chances of Flare Up:",
                          style: TextStyle(
                              color: Global.textColor(), fontSize: 20)),
                      Container(
                          width: 70,
                          height: 70,
                          color: Color.fromARGB(255, 255, 255, 255),
                          alignment: Alignment.center,
                          child: Text(widget.percent.toString() + "%",
                              style: TextStyle(fontSize: 30))),
                    ])),
            Global.divider(context),
            Container(
                decoration: decoration,
                alignment: Alignment.center,
                width: Global.getWidthByPercentage(context, 90),
                height: Global.getHeightByPercentage(context, 60),
                child: Text("graph")),
            Global.divider(context),
            Container(
                decoration: decoration,
                width: Global.getWidthByPercentage(context, 90),
                height: Global.getHeightByPercentage(context, 40),
                alignment: Alignment.center,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("MORE INFORMATION"),
                      Text(widget.description)
                    ]))
          ],
        ),
      ),
    );
  }
}
