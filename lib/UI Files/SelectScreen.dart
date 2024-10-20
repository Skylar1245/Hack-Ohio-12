import 'package:flutter/material.dart';
import 'package:hackohio12/global_methods.dart';
import 'package:hackohio12/UserPref.dart';
import 'package:hackohio12/UI%20Files/homescreen.dart';

class SelectScreen extends StatefulWidget {
  const SelectScreen({super.key, required this.title});

  final String title;

  @override
  State<SelectScreen> createState() => _SkeletonState();
}

class _SkeletonState extends State<SelectScreen> {
  void state(String str) {
    setState(() {
      if(str == "m") {
      userPref.setMigraine(!userPref.migraine);
      }
      if(str == "as"){
        userPref.setAsthma(!userPref.asthma);
      }
      if(str == "ar"){
        userPref.setArthritis(!userPref.arthritis);
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
          if(snapshot.data == true) {
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
                                  color: const Color.fromARGB(
                                      255, 255, 255, 255))),
                          child: CheckboxListTile(
                              checkColor: Global.tableData(),
                              title: Text(
                                "Migraine",
                                style: TextStyle(
                                    color: Global.textColor(), fontSize: 20),
                              ),
                              value: userPref.migraine,
                              onChanged: (value) {
                                state("m");
                              },
                              controlAffinity: ListTileControlAffinity.leading),
                        ),
                        Global.divider(context),
                        Container(
                          width: Global.getWidthByPercentage(context, 80),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.transparent,
                              border: Border.all(
                                  color: const Color.fromARGB(
                                      255, 255, 255, 255))),
                          child: CheckboxListTile(
                              checkColor: Global.tableData(),
                              title: Text(
                                "Asthma",
                                style: TextStyle(
                                    color: Global.textColor(), fontSize: 20),
                              ),
                              value: userPref.asthma,
                              onChanged: (value){state("as");},
                              controlAffinity: ListTileControlAffinity.leading),
                        ),
                        Global.divider(context),
                        Container(
                          width: Global.getWidthByPercentage(context, 80),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.transparent,
                              border: Border.all(
                                  color: const Color.fromARGB(
                                      255, 255, 255, 255))),
                          child: CheckboxListTile(
                              checkColor: Global.tableData(),
                              title: Text(
                                "Arthritis",
                                style: TextStyle(
                                    color: Global.textColor(), fontSize: 20),
                              ),
                              value: userPref.arthritis,
                              onChanged: (value){state("ar");},
                              controlAffinity: ListTileControlAffinity.leading),
                        ),
                        Global.divider(context),
                        FloatingActionButton(child: Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  HomeScreen(title: 'Home Screen'),
                            ),
                          );
                        })
                      ]))
                ],
              ),
            ),
          );} else {
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          }
        });
  }
}
