// ignore_for_file: prefer_const_constructors, unnecessary_new, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'package:login_page/attendance_model.dart';

class InfoPage extends StatefulWidget {
  List<SummaryModel> summary2 = <SummaryModel>[];
  List<EmptyModel> rooms2 = <EmptyModel>[];
  InfoPage({required this.summary2, required this.rooms2});

  @override
  State<InfoPage> createState() => _InfoPageState(summary:summary2, rooms: rooms2);
}

class _InfoPageState extends State<InfoPage> {
  List<SummaryModel> summary = <SummaryModel>[];
  List<EmptyModel> rooms = <EmptyModel>[];
  _InfoPageState({required this.summary, required this.rooms});
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
                    'Current Count : ${summary[0].currentCount}',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Max Count : ${summary[0].maxCount}', style: TextStyle(fontSize: 20)),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Empty Rooms : ${summary[0].emptyRoom}', style: TextStyle(fontSize: 20)),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Last Updated : ${summary[0].lastUpdated}',
                      style: TextStyle(fontSize: 20)),
                ],
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Card(
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
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
  
  final int roomNo, totalOccupants, currentOccupants;

  InfoWid(
      {
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
              Text('Room No. - ${roomNo}'),
              SizedBox(
                height: 5,
              ),
              Text('Occupants - ${totalOccupants}'),
              SizedBox(
                height: 5,
              ),
            ]),
            // Column(
            //   children: [
            //     SizedBox(
            //       height: 5,
            //     ),
            //     Text('${roomNo}'),
            //     SizedBox(
            //       height: 5,
            //     ),
            //     Text('${totalOccupants}'),
            //     SizedBox(
            //       height: 27,
            //     )
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
