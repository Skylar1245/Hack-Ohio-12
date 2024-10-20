import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
/*
class BarGraph extends StatefulWidget {
  const BarGraph({super.key, required this.y});

  final List<int> y;

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
                  BarSeries<int, int>(

                      color: Colors.black,
                      width: 7,
                      xValueMapper: (int s, int i) {
                        return i;
                      },
                      yValueMapper: (int s, int i) {
                        return widget.y[i];
                      })
                ]))));
  }
}
*/

class BarGraph {
  const BarGraph();


  Container graph(List<int> y){
    return Container(
            color: Colors.yellow,
            child: Center(
                child: SfCartesianChart (
                    //borderColor: Colors.purple,
                    //borderWidth: 5,
                    series: <CartesianSeries>[
                  // Renders line chart
                  BarSeries<int, int>(

                      color: Colors.black,
                      width: 7,
                      xValueMapper: (int s, int i) {
                        return i;
                      },
                      yValueMapper: (int s, int i) {
                        return y[i];
                      })
                ])));
  }
}
