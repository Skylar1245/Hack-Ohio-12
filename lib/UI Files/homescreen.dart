import 'package:flutter/material.dart';
import 'package:hackohio12/UI%20Files/DataPage.dart';
import 'package:hackohio12/global_methods.dart';

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
                    borderRadius: BorderRadius.circular(
                        20), // Adjust the radius as needed
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
                          SizedBox(width: Global.getWidthByPercentage(context, 10)),
                          Image.asset('assets/sunnyweather.png'), SizedBox(width: Global.getWidthByPercentage(context, 30),),
                          Text('80°', //FIXME temperature goes here 
                              style: TextStyle(
                                  fontSize: 50, color: Global.textColor())),
                        ],
                      ),
                      divider,
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                20), // Adjust the radius as needed
                            color: const Color.fromARGB(255, 211, 98, 98),
                          ),
                          //padding: const EdgeInsets.all(8.0),
                          alignment: Alignment.center,
                          width: Global.getWidthByPercentage(context, 80),
                          child: Text('Weekly forecast'))
                    ],
                  )),
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
                                    builder: (context) => const DataPage(
                                      title: 'My Health',
                                      percent: 10,
                                    ),
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
                                    builder: (context) => const DataPage(
                                      title: 'Migraines',
                                      percent: 10,
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
                                    builder: (context) => const DataPage(
                                      title: 'Asthma',
                                      percent: 10,
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
                                    builder: (context) => const DataPage(
                                      title: 'Arthritis',
                                      percent: 10,
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
                            )
                          ])))
            ]));
  }
}
