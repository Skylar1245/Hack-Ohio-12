import 'package:flutter/material.dart';
import 'package:hackohio12/global_methods.dart';

class UserInput extends StatefulWidget {
  const UserInput({super.key, required this.title});

  final String title;

  @override
  State<UserInput> createState() => _SkeletonState();
}

class _SkeletonState extends State<UserInput> {
  @override
  Widget build(BuildContext context) {
    Divider tempDivider = Divider(height: 5, color: Colors.transparent,);
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
                height: Global.getHeightByPercentage(context, 38),
                child: Column(
                  children: [
                    Divider(height: 10, color: Colors.transparent),
                    Text("Input Today's Data",
                        style:
                            TextStyle(color: Global.textColor(), fontSize: 24)),
                    //Divider(height: 5, color: Colors.transparent),
                    Align(
                        alignment: Alignment.center,
                        child: Container(
                            width: Global.getWidthByPercentage(context, 80),
                            height: Global.getHeightByPercentage(context, 30),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Global.textColor()),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  "\nWhich conditions have you had flare-ups of today?",
                                  style: TextStyle(
                                    fontSize:
                                        Global.getWidthByPercentage(context, 3),
                                    color: Global.textColor(),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                CheckboxListTile(
                                    checkColor: Global.tableData(),
                                    title: Text(
                                      "Migraine",
                                      style: TextStyle(
                                          color: Global.textColor(),
                                          fontSize: 12),
                                    ),
                                    value: true,
                                    onChanged: null,
                                    controlAffinity:
                                        ListTileControlAffinity.leading),
                                CheckboxListTile(
                                    checkColor: Global.tableData(),
                                    title: Text(
                                      "Asthma",
                                      style: TextStyle(
                                          color: Global.textColor(),
                                          fontSize: 12),
                                    ),
                                    value: true,
                                    onChanged: null,
                                    controlAffinity:
                                        ListTileControlAffinity.leading),CheckboxListTile(
                        checkColor: Global.tableData(),
                        title: Text(
                          "Arthritis",
                          style: TextStyle(
                              color: Global.textColor(), fontSize: 12),
                        ),
                        value: true,
                        onChanged: null,
                        controlAffinity: ListTileControlAffinity.leading),
                              ],
                            ))),
                  ],
                )),
            Global.divider(context),
            Container(
                decoration: decoration,
                width: Global.getWidthByPercentage(context, 90),
                height: Global.getHeightByPercentage(context, 38))
          ],
        ),
      ),
    );
  }
}
