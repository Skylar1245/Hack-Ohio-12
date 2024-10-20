import 'package:flutter/material.dart';
import 'package:hackohio12/global_methods.dart';

class SelectScreen extends StatefulWidget {
  const SelectScreen({super.key, required this.title});

  final String title;

  @override
  State<SelectScreen> createState() => _SkeletonState();
}

class _SkeletonState extends State<SelectScreen> {
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                decoration: decoration,
                width: Global.getWidthByPercentage(context, 90),
                height: Global.getHeightByPercentage(context, 70),
                child: Column(children: [
                  Global.divider(context),
                  Container(
                    width: Global.getWidthByPercentage(context, 80),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.transparent,
                        border: Border.all(
                            color: const Color.fromARGB(255, 255, 255, 255))),
                    child: CheckboxListTile(
                        checkColor: Global.tableData(),
                        title: Text(
                          "Migraine",
                          style: TextStyle(
                              color: Global.textColor(), fontSize: 20),
                        ),
                        value: true,
                        onChanged: null,
                        controlAffinity: ListTileControlAffinity.leading),
                  ),
                  Global.divider(context),
                 Container(
                    width: Global.getWidthByPercentage(context, 80),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.transparent,
                        border: Border.all(
                            color: const Color.fromARGB(255, 255, 255, 255))),
                    child: CheckboxListTile(
                        checkColor: Global.tableData(),
                        title: Text(
                          "Asthma",
                          style: TextStyle(
                              color: Global.textColor(), fontSize: 20),
                        ),
                        value: false,
                        onChanged: null,
                        controlAffinity: ListTileControlAffinity.leading),
                  ),
                  Global.divider(context),
                  Container(
                    width: Global.getWidthByPercentage(context, 80),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.transparent,
                        border: Border.all(
                            color: const Color.fromARGB(255, 255, 255, 255))),
                    child: CheckboxListTile(
                        checkColor: Global.tableData(),
                        title: Text(
                          "Arthritis",
                          style: TextStyle(
                              color: Global.textColor(), fontSize: 20),
                        ),
                        value: true,
                        onChanged: null,
                        controlAffinity: ListTileControlAffinity.leading),
                  ),
                ]))
          ],
        ),
      ),
    );
  }
}
