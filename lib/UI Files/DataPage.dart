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
  Graph chooseGraph() {
    if (widget.title.contains("Migraine")) {
      return Graph(flareUpChance: WeatherAnalysis.checkMigraineChances());
    } else if (widget.title.contains("Arthritis")) {
      return Graph(flareUpChance: WeatherAnalysis.getArthritisChances());
    } else {
      return Graph(flareUpChance: WeatherAnalysis.getAsthmaChances());
    }
  }

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
                      FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                            " Today's Chances of Flare Up: ", //words too close to left FIXME
                            style: TextStyle(
                                color: Global.textColor(), fontSize: 16)),
                      ),
                      Expanded(
                          child: Text("${widget.percent}%",
                              style: TextStyle(
                                  color: Global.textColor(), fontSize: 40)))
                    ])),
            Global.divider(context),
            Container(
              decoration: decoration,
              alignment: Alignment.center,
              width: Global.getWidthByPercentage(context, 90),
              height: Global.getHeightByPercentage(context, 40),
              child: Column(
                children: [
                  Global.divider(context),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        alignment: Alignment.center,
                        width: Global.getWidthByPercentage(context, 80),
                        height: Global.getHeightByPercentage(context, 30),
                        child: chooseGraph(),
                      )),
                ],
              ),
            ),
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
                            Flexible(
                              child: Text(
                                widget.description,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Global.textColor(),
                                ),
                                softWrap: true,
                                overflow: TextOverflow.visible,
                              ),
                            ),
                          ])),
                    ])),
            Global.divider(context),
          ],
        ),
      ),
    );
  }
}
