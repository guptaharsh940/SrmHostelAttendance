// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_key_in_widget_constructors

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'attendance_model.dart';
import 'information.dart';
import 'package:flutter/foundation.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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
    Timer(
        Duration(seconds: 10),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    InfoPage(summary2: summary, rooms2: rooms))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('SRM Hostel Attendance'),
          backgroundColor: Color(0x00000000),
          centerTitle: true,
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
          ],
        )));
  }
}
