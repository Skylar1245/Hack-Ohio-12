import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Graph extends StatefulWidget {
  const Graph({super.key, required this.flareUpChance});

  final List<double> flareUpChance;
  @override
  State<Graph> createState() => _GraphState();
}

class _GraphState extends State<Graph> {
  int i = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Colors.yellow,
            child: Center(
                child: SfCartesianChart(
                    borderColor: Colors.purple,
                    plotAreaBorderColor: Colors.red,
                    borderWidth: 5,
                    plotAreaBorderWidth: 5,
                    backgroundColor: Colors.transparent,
                    plotAreaBackgroundColor: Colors.orange,
                    primaryXAxis: CategoryAxis(
                            title: AxisTitle(
                                text: 'Week Days',
                                textStyle: TextStyle(
                                    color: Colors.deepOrange,
                                    fontFamily: 'Roboto',
                                    fontSize: 16,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w300
                                )
                            )
                        ),
                        primaryYAxis: CategoryAxis(
                            initialVisibleMinimum: 0,
                            initialVisibleMaximum: 1,
                            title: AxisTitle(
                                text: 'Chance of Flare-Up',
                                textStyle: TextStyle(
                                    color: Colors.deepOrange,
                                    fontFamily: 'Roboto',
                                    fontSize: 16,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w300
                                )
                            )
                        ),
                    series: <CartesianSeries>[
                  // Renders line chart
                  LineSeries<double, int>(
                      dataSource: widget.flareUpChance,
                      color: Colors.black,
                      width: 7,
                      xValueMapper: (double d, int i) {
                        return i;
                      },
                      yValueMapper: (double d, int i) {
                        return widget.flareUpChance[i];
                      })
                ]))));
  }
}
