import 'package:flutter/material.dart';
import 'package:hackohio12/global_methods.dart';
import 'package:hackohio12/UserPref.dart';

class UserInput extends StatefulWidget {
  const UserInput({super.key, required this.title});

  final String title;

  @override
  State<UserInput> createState() => _SkeletonState();
}

class _SkeletonState extends State<UserInput> {
  void state(String str) {
    setState(() {
      if (str == "m") {
        userPref.incMigraine();
        userPref.setMigraineCountToggle(!userPref.migraineCountToggle);
      }
      if (str == "as") {
        userPref.incAsthma();
        userPref.setAsthmaCountToggle(!userPref.asthmaCountToggle);
      }
      if (str == "ar") {
        userPref.incArthritis();
        userPref.setArthritisCountToggle(!userPref.arthritisCountToggle);
      }
      if (str == "clear") {
        userPref.setMigraineCountToggle(false);
        userPref.setAsthmaCountToggle(false);
        userPref.setArthritisCountToggle(false);
      }
    });
  }

  UserPref userPref = UserPref();

  @override
  Widget build(BuildContext context) {
    Decoration decoration = BoxDecoration(
      gradient: Global.gradient(),
      borderRadius: BorderRadius.circular(20), // Adjust the radius as needed
    );

    return FutureBuilder(
        future: userPref.update(),
        builder: (context, snapshot) {
          if (snapshot.data == true) {
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
                                style: TextStyle(
                                    color: Global.textColor(), fontSize: 24)),
                            //Divider(height: 5, color: Colors.transparent),
                            Align(
                                alignment: Alignment.center,
                                child: Container(
                                    width: Global.getWidthByPercentage(
                                        context, 80),
                                    height: Global.getHeightByPercentage(
                                        context, 30),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border:
                                          Border.all(color: Global.textColor()),
                                    ),
                                    child: SingleChildScrollView(child: Column(
                                      children: [
                                        Text(
                                          "\nWhich conditions have you had flare-ups of today?",
                                          style: TextStyle(
                                            fontSize:
                                                Global.getWidthByPercentage(
                                                    context, 3),
                                            color: Global.textColor(),
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        userPref.migraine
                                            ? Container(
                                                width:
                                                    Global.getWidthByPercentage(
                                                        context, 70),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: Colors.transparent,
                                                    border: Border.all(
                                                        color: const Color
                                                            .fromARGB(255, 255,
                                                            255, 255))),
                                                child: CheckboxListTile(
                                                    checkColor:
                                                        Global.tableData(),
                                                    title: Text(
                                                      "Migraine",
                                                      style: TextStyle(
                                                          color: Global
                                                              .textColor(),
                                                          fontSize: 15),
                                                    ),
                                                    value: userPref
                                                        .migraineCountToggle,
                                                    onChanged: (value) {
                                                      state("m");
                                                    },
                                                    controlAffinity:
                                                        ListTileControlAffinity
                                                            .leading))
                                            : SizedBox(),
                                        userPref.asthma
                                            ? Container(
                                                width:
                                                    Global.getWidthByPercentage(
                                                        context, 70),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: Colors.transparent,
                                                    border: Border.all(
                                                        color: const Color
                                                            .fromARGB(255, 255,
                                                            255, 255))),
                                                child: CheckboxListTile(
                                                    checkColor:
                                                        Global.tableData(),
                                                    title: Text(
                                                      "Asthma",
                                                      style: TextStyle(
                                                          color: Global
                                                              .textColor(),
                                                          fontSize: 15),
                                                    ),
                                                    value: userPref
                                                        .asthmaCountToggle,
                                                    onChanged: (value) {
                                                      state("as");
                                                    },
                                                    controlAffinity:
                                                        ListTileControlAffinity
                                                            .leading))
                                            : SizedBox(),
                                        userPref.arthritis
                                            ? Container(
                                                width:
                                                    Global.getWidthByPercentage(
                                                        context, 70),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: Colors.transparent,
                                                    border: Border.all(
                                                        color: const Color
                                                            .fromARGB(255, 255,
                                                            255, 255))),
                                                child: CheckboxListTile(
                                                    checkColor:
                                                        Global.tableData(),
                                                    title: Text(
                                                      "Arthritis",
                                                      style: TextStyle(
                                                          color: Global
                                                              .textColor(),
                                                          fontSize: 15),
                                                    ),
                                                    value: userPref
                                                        .arthritisCountToggle,
                                                    onChanged: (value) {
                                                      state("ar");
                                                    },
                                                    controlAffinity:
                                                        ListTileControlAffinity
                                                            .leading))
                                            : SizedBox(),
                                        Divider(
                                            height: 6,
                                            color: Colors.transparent),
                                        FloatingActionButton(
                                            child: Icon(Icons.check),
                                            onPressed: () {
                                              state("clear");
                                            })
                                      ],
                                    )))),
                          ],
                        )),
                    Global.divider(context),
                    Container(
                      decoration: decoration,
                      width: Global.getWidthByPercentage(context, 90),
                      height: Global.getHeightByPercentage(context, 38),
                      child: Column(
                        children: [
                          Text(
                            "\nYour conditions for the past month",
                            style: TextStyle(
                                color: Global.textColor(), fontSize: 16),
                          ),
                          Align(
                              alignment: Alignment.center,
                              child: Container(
                                  width:
                                      Global.getWidthByPercentage(context, 80),
                                  height:
                                      Global.getHeightByPercentage(context, 30),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border:
                                        Border.all(color: Global.textColor()),
                                  )))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          } else {
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          }
        });
  }
}
