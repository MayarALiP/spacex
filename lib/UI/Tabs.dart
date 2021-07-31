import 'package:flutter/material.dart';
import 'package:flutter_spacex/API/Dragons/ui/DragonConn2.dart';
import 'package:flutter_spacex/API/Ship/ui/ShipConn.dart';
import 'package:flutter_spacex/API/Lanuches/ui/LunConn.dart';

class Tabs extends StatefulWidget {
  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 120,
          backgroundColor: Colors.black,
          bottom: TabBar(
              indicatorColor: Colors.white,
              indicatorWeight: 5,

            tabs: [
              Tab(text:("Dragon") ),
              Tab(text:("Launches")),
              Tab(text:("Ships")),
            ],
          ),

          title: Text('SpaceX',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)
            ),
          ),

        ),


        body: TabBarView(children: [
            
            SizedBox(child: DragonConn()),
            SizedBox(child: LanuchesConn()),
            SizedBox(child:ShipConn()),
          ],
        ),
      ),
    );
  }
}
