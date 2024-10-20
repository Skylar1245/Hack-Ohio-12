import 'package:flutter/material.dart';
import 'package:hackohio12/UI%20Files/graph.dart';
import 'package:hackohio12/Weather/weather_analysis.dart';
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
                      Text("${widget.percent}%",
                          style: TextStyle(
                              color: Global.textColor(), fontSize: 50))
                    ])),
            Global.divider(context),
            Container(
                decoration: decoration,
                alignment: Alignment.center,
                width: Global.getWidthByPercentage(context, 90),
                height: Global.getHeightByPercentage(context, 60),
                child: Graph(flareUpChance: WeatherAnalysis.checkMigraineChances())),
            Global.divider(context),
            Container(
                decoration: decoration,
                width: Global.getWidthByPercentage(context, 90),
                height: Global.getHeightByPercentage(context, 40),
                //alignment: Alignment.center,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Divider(height: 10, color: Colors.transparent),
                      Text("MORE INFORMATION",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 30, color: Global.textColor())),
                      Divider(height: 10, color: Colors.transparent),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Row(children: [
                            VerticalDivider(width: 15),
                            Text(widget.description,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Global.textColor(),
                                ))
                          ])),
                    ])),
            Global.divider(context),
          ],
        ),
      ),
    );
  }
}
