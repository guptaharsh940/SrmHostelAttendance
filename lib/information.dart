// ignore_for_file: prefer_const_constructors, unnecessary_new, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:login_page/attendance_model.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  List<SummaryModel> summary = <SummaryModel>[];
  List<EmptyModel> rooms = <EmptyModel>[];

  // String lastUpdated;
  getAttendance() async {
    var raw = await http.get(Uri.parse(
        "https://script.google.com/macros/s/AKfycbz-AK7ytPZZh2bakPxgSnQwWImzEshJgn006AKBZGbW27twonKp0U5mygKtYr9JbuLmlQ/exec"));

    if (kDebugMode) {
      print("Running");
    }
    var jsonAttd = convert.jsonDecode(raw.body);
    if (kDebugMode) {
      print('Json file $jsonAttd');
    }
    // attendance = jsonAttd.map((json) => AttendanceModel.fromJson(json));

    jsonAttd.forEach((element) {
      // if (kDebugMode) {
      //   print(element);
      // }
      if (element['Key'] == 1) {
        if (kDebugMode) {
          print("I am heree");
        }
        SummaryModel summaryModel = new SummaryModel();
        summaryModel.currentCount = element['Current Count'];
        summaryModel.maxCount = element['Max Count'];
        summaryModel.emptyRoom = element['Empty Rooms'];
        summaryModel.lastUpdated = element['Last Updated'];

        summary.add(summaryModel);
      } else {
        EmptyModel emptyModel = new EmptyModel();
        emptyModel.roomNo = element['Room No'];
        emptyModel.currentOccupants = element['Current Occupants'];
        emptyModel.totalOccupants = element['Total Occupants'];

        rooms.add(emptyModel);
      }
    });
  }

  @override
  void initState() {
    getAttendance();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // getAttendance();
      if (kDebugMode) {
        print("Started Fuck");
      }
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              bottom: const TabBar(
                tabs: [
                  Tab(text: 'Summary'),
                  Tab(text: 'Empty Rooms'),
                ],
              ),
              title: const Text('Result'),
            ),
            body: TabBarView(children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    'Current Count : 0',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Max Count : 450', style: TextStyle(fontSize: 20)),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Empty Rooms : 120', style: TextStyle(fontSize: 20)),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Last Updated : 12-11-22/2:38PM',
                      style: TextStyle(fontSize: 20)),
                ],
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Card(
                        child: ListView.builder(
                            itemCount: rooms.length,
                            itemBuilder: (context, index) {
                              return InfoWid(
                                  roomNo: rooms[index].roomNo,
                                  totalOccupants: rooms[index].totalOccupants,
                                  currentOccupants:
                                      rooms[index].currentOccupants);
                            }))
                  ])
            ])));
  }
}

class InfoWid extends StatelessWidget {
  final int currentCount, maxCount, emptyRoom;
  final String lastUpdated;
  final int roomNo, totalOccupants, currentOccupants;

  InfoWid(
      {this.currentCount = 0,
      this.maxCount = 0,
      this.emptyRoom = 0,
      this.lastUpdated = "",
      this.roomNo = 0,
      this.totalOccupants = 0,
      this.currentOccupants = 0});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Row(
          children: [
            Column(children: [
              Text('Room No. -  '),
              SizedBox(
                height: 5,
              ),
              Text('Occupants - '),
              SizedBox(
                height: 5,
              ),
              Text('         12-11-22 / 12:38'),
            ]),
            Column(
              children: [
                SizedBox(
                  height: 4,
                ),
                Text('303'),
                SizedBox(
                  height: 6,
                ),
                Text('3'),
                SizedBox(
                  height: 27,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
