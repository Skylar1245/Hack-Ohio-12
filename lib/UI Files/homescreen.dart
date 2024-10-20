import 'package:flutter/material.dart';
import 'package:hackohio12/UI%20Files/DataPage.dart';
import 'package:hackohio12/UI%20Files/UserInput.dart';
import 'package:hackohio12/global_methods.dart';
import 'package:hackohio12/UI%20Files/SelectScreen.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Divider divider = Divider(height: 10, color: Colors.transparent);
    Divider visibleDivider = Divider(height: 10, color: Colors.white);
    Divider buttonDivider = Divider(height: 20, color: Colors.transparent);
    Divider tableDivider = Divider(height: 5, color: Colors.transparent);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Global.appBar(),
          title: Text(widget.title),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(20), // Adjust the radius as needed
                  gradient: Global.gradient(),
                ),
                alignment: Alignment.bottomCenter,
                width: Global.getWidthByPercentage(context, 90),
                height: Global.getHeightByPercentage(context, 30),
                child: Column(
                  children: [
                    divider,
                    Row(
                      children: [
                        SizedBox(
                            width: Global.getWidthByPercentage(context, 10)),
                        Image.asset('assets/sunnyweather.png'),
                        SizedBox(
                          width: Global.getWidthByPercentage(context, 20),
                        ),
                        Text(
                            '${Global.weatherData.getUpcomingTemperatures().elementAt(0).round()}°F',
                            style: TextStyle(
                                fontSize: 50, color: Global.textColor())),
                      ],
                    ),
                    tableDivider,
                    Text(
                      Global.userLocation(),
                      style: TextStyle(color: Global.textColor()),
                    ),
                    divider,
                    Container(
                        decoration: BoxDecoration(
                          color: Global.tableData(),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        //padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        width: Global.getWidthByPercentage(context, 80),
                        child: Table(children: [
                          TableRow(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                    color: Global.tableHeader(),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                    )),
                                height: 20,
                                child: Text(
                                    DateFormat('EEEE')
                                        .format(DateTime.now())
                                        .substring(0, 3),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.black)),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Global.tableHeader(),
                                    borderRadius: BorderRadius.only()),
                                height: 20,
                                child: Text(
                                    DateFormat('EEEE')
                                        .format(DateTime.now()
                                            .add(const Duration(days: 1)))
                                        .substring(0, 3),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.black)),
                              ),
                              Container(
                                height: 20,
                                color: Global.tableHeader(),
                                child: Text(
                                    DateFormat('EEEE')
                                        .format(DateTime.now()
                                            .add(const Duration(days: 2)))
                                        .substring(0, 3),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.black)),
                              ),
                              Container(
                                height: 20,
                                color: Global.tableHeader(),
                                child: Text(
                                    DateFormat('EEEE')
                                        .format(DateTime.now()
                                            .add(const Duration(days: 3)))
                                        .substring(0, 3),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.black)),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Global.tableHeader(),
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20),
                                    )),
                                height: 20,
                                child: Text(
                                    DateFormat('EEEE')
                                        .format(DateTime.now()
                                            .add(const Duration(days: 4)))
                                        .substring(0, 3),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.black)),
                              ),
                            ],
                          ),
                          TableRow(children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  )),
                              height: 40,
                              child: Column(
                                children: [
                                  tableDivider,
                                  Text(
                                    '${Global.weatherData.getUpcomingTemperatures().elementAt(0).round()}°',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Global.textColor(),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                    )),
                                height: 40,
                                child: Column(
                                  children: [
                                    tableDivider,
                                    Text(
                                        '${Global.weatherData.getUpcomingTemperatures().elementAt(1).round()}°',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Global.textColor(),
                                        )),
                                  ],
                                )),
                            Container(
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                    )),
                                height: 40,
                                child: Column(
                                  children: [
                                    tableDivider,
                                    Text(
                                        '${Global.weatherData.getUpcomingTemperatures().elementAt(2).round()}°',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Global.textColor(),
                                        ))
                                  ],
                                )),
                            Container(
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                    )),
                                height: 40,
                                child: Column(
                                  children: [
                                    tableDivider,
                                    Text(
                                        '${Global.weatherData.getUpcomingTemperatures().elementAt(3).round()}°',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Global.textColor(),
                                        ))
                                  ],
                                )),
                            Container(
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                    )),
                                height: 40,
                                child: Column(
                                  children: [
                                    tableDivider,
                                    Text(
                                        '${Global.weatherData.getUpcomingTemperatures().elementAt(4).round()}°',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Global.textColor(),
                                        ))
                                  ],
                                ))
                          ]),
                        ]))
                  ],
                ),
              ),
              divider,
              Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            20), // Adjust the radius as needed
                        gradient: Global.gradient(),
                      ),
                      //padding: const EdgeInsets.all(8.0),
                      alignment: Alignment.bottomCenter,
                      width: Global.getWidthByPercentage(context, 90),
                      height: Global.getHeightByPercentage(context, 60),
                      child: ListView(
                          padding: const EdgeInsets.all(8),
                          children: <Widget>[
                            buttonDivider,
                            FloatingActionButton.extended(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    20.0), // Adjust the radius for more/less rounding
                                side: BorderSide(
                                  color: Colors.white, // Border color
                                  width: 2.0, // Border width
                                ),
                              ),
                              backgroundColor: Colors
                                  .transparent, // Make FAB background transparent
                              elevation: 0, // Remove shadow
                              heroTag: "0",
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        UserInput(title: 'My Health'),
                                  ),
                                );
                              },
                              label: Text(
                                'My Health',
                                style: TextStyle(color: Global.textColor()),
                              ),
                              icon: Icon(Icons.medical_information,
                                  color: Colors.white),
                            ),
                            buttonDivider,
                            visibleDivider,
                            buttonDivider,
                            FloatingActionButton.extended(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    20.0), // Adjust the radius for more/less rounding
                                side: BorderSide(
                                  color: Colors.white, // Border color
                                  width: 2.0, // Border width
                                ),
                              ),
                              backgroundColor: Colors
                                  .transparent, // Make FAB background transparent
                              elevation: 0, // Remove shadow
                              heroTag: "1",
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DataPage(
                                      title: 'Migraines',
                                      percent: Global.percent(
                                          MedicalCondition.migraine),
                                      description: Global.description(
                                          MedicalCondition.migraine),
                                    ),
                                  ),
                                );
                              },
                              label: Text(
                                'Migraines',
                                style: TextStyle(color: Global.textColor()),
                              ),
                              icon: Icon(Icons.face, color: Colors.white),
                            ),
                            buttonDivider,
                            FloatingActionButton.extended(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    20.0), // Adjust the radius for more/less rounding
                                side: BorderSide(
                                  color: Colors.white, // Border color
                                  width: 2.0, // Border width
                                ),
                              ),
                              backgroundColor: Colors
                                  .transparent, // Make FAB background transparent
                              elevation: 0, // Remove shadow
                              heroTag: "2",
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DataPage(
                                      title: 'Asthma',
                                      percent: Global.percent(
                                          MedicalCondition.asthma),
                                      description: Global.description(
                                          MedicalCondition.asthma),
                                    ),
                                  ),
                                );
                              },
                              label: Text(
                                'Asthma',
                                style: TextStyle(color: Global.textColor()),
                              ),
                              icon: Icon(Icons.air, color: Colors.white),
                            ),
                            buttonDivider,
                            FloatingActionButton.extended(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    20.0), // Adjust the radius for more/less rounding
                                side: BorderSide(
                                  color: Colors.white, // Border color
                                  width: 2.0, // Border width
                                ),
                              ),
                              backgroundColor: Colors
                                  .transparent, // Make FAB background transparent
                              elevation: 0, // Remove shadow
                              heroTag: "3",
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DataPage(
                                      title: 'Arthritis',
                                      percent: Global.percent(
                                          MedicalCondition.arthritis),
                                      description: Global.description(
                                          MedicalCondition.arthritis),
                                    ),
                                  ),
                                );
                              },
                              label: Text(
                                'Arthritis',
                                style: TextStyle(color: Global.textColor()),
                              ),
                              icon: Icon(Icons.waving_hand_sharp,
                                  color: Colors.white),
                            ),
                            buttonDivider,
                            FloatingActionButton.extended(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    20.0), // Adjust the radius for more/less rounding
                                side: BorderSide(
                                  color: Colors.white, // Border color
                                  width: 2.0, // Border width
                                ),
                              ),
                              backgroundColor: Global
                                  .tableData(), // Make FAB background transparent
                              elevation: 0, // Remove shadow
                              heroTag: "4",
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        SelectScreen(title: 'Add'),
                                  ),
                                );
                              },
                              label: Text(
                                'Add Condition',
                                style: TextStyle(color: Global.textColor()),
                              ),
                              icon: Icon(Icons.add, color: Colors.white),
                            )
                          ]))),
              divider
            ]));
  }
}
