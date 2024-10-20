import 'package:flutter/material.dart';
import 'package:hackohio12/global_methods.dart';
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
            color: Global.tableData(),
            child: Center(
                child: SfCartesianChart(
                    borderColor: Colors.transparent,
                    plotAreaBorderColor: Colors.red,
                    borderWidth: 0,
                    plotAreaBorderWidth: 0,
                    backgroundColor: Colors.transparent,
                    plotAreaBackgroundColor: const Color.fromARGB(255, 154, 193, 255),
                    primaryXAxis: CategoryAxis(
                            title: AxisTitle(
                                text: 'Week Days',
                                textStyle: TextStyle(
                                    color: Colors.black,
                                    //fontFamily: 'Roboto',
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
                                    color: Colors.black,
                                    //fontFamily: 'Roboto',
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
                      color: Colors.blue,
                      width: 5,
                      xValueMapper: (double d, int i) {
                        return i;
                      },
                      yValueMapper: (double d, int i) {
                        return widget.flareUpChance[i];
                      })
                ]))));
  }
}
