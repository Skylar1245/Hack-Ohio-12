import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class BarGraph extends StatefulWidget {
  const BarGraph({super.key, required this.flareUpChance});

  final List<double> flareUpChance;

  @override
  State<BarGraph> createState() => _BarGraph();
}

class _BarGraph extends State<BarGraph> {
  int i = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Colors.yellow,
            child: Center(
                child: SfCartesianChart (
                    //borderColor: Colors.purple,
                    //borderWidth: 5,
                    series: <CartesianSeries>[
                  // Renders line chart
                  BarSeries<double, int>(
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
