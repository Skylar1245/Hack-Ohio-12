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
            body: Center(
                child: Container(
                    child: SfCartesianChart(
                        series: <CartesianSeries>[
                            // Renders line chart
                            LineSeries<double, int>(
                                dataSource: widget.flareUpChance,
                                xValueMapper: (double d, int i ) {return i;},
                                yValueMapper: (double d, int i) {return widget.flareUpChance[i];}
                            )
                        ]
                    )
                )
            )
        );
    }
}