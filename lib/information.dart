// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
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
            body: TabBarView(
              children: [
                Column(mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text('Current Count : 234',style: TextStyle(fontSize: 20),),
                    SizedBox(
                      height: 20,
                    ),
                    Text('Max Count : 450',style: TextStyle(fontSize: 20)),
                    SizedBox(
                      height: 20,
                    ),
                    Text('Empty Rooms : 120',style: TextStyle(fontSize: 20)),
                    SizedBox(
                      height: 20,
                    ),
                    Text('Last Updated : 12-11-22/2:38PM',style: TextStyle(fontSize: 20)),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Card(
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
                    ),
                    Card(
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
                    ),
                    Card(
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
                    ),
                    Card(
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
                    ),
                    Card(
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
                    ),
                    Card(
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
                    ),
                  ],
                ),
              ],
            ),
      ),
    );
  }
}